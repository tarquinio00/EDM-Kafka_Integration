package dev.tartar.connect;


import org.apache.kafka.clients.consumer.OffsetAndMetadata;
import org.apache.kafka.common.TopicPartition;
import org.apache.kafka.common.config.AbstractConfig;
import org.apache.kafka.common.config.ConfigException;
import org.apache.kafka.connect.data.Struct;
import org.apache.kafka.connect.errors.RetriableException;
import org.apache.kafka.connect.sink.SinkRecord;
import org.apache.kafka.connect.sink.SinkTask;

import org.json.JSONArray;
import org.json.JSONObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dev.tartar.connect.counterApp.Counter;
import dev.tartar.connect.keycloakAuth.ConfidentialAuthService;
import dev.tartar.connect.traceability.TraceabilityJsonItem;

import java.io.PrintStream;

import java.lang.reflect.Type;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;



public class CustomSinkConnectorTask extends SinkTask {
    private static final Logger log = LoggerFactory.getLogger(CustomSinkConnectorTask.class);

    private static String SOURCE = "STAZIONE_INGRESSO_MOTORI";
    private PrintStream outputStream;
    private static ConfidentialAuthService Auth;
    private static Counter AppCounter;
    private String token;

    public CustomSinkConnectorTask() {}


    @Override
    public String version() {
        return new CustomSinkConnector().version();
    }

    @Override
    public void start(Map<String, String> props) {
        AbstractConfig config = new AbstractConfig(CustomSinkConnector.CONFIG_DEF, props);
        String sso_url = config.getString(CustomSinkConnector.SSO_URL);
        String reame = config.getString(CustomSinkConnector.RealmName);
        String client_id = config.getString(CustomSinkConnector.CLIENT_ID);
        String client_scret = config.getString(CustomSinkConnector.CLIENT_SECRET);
        String certs = config.getString(CustomSinkConnector.CERTS_URL);
        String counterApp_url = config.getString(CustomSinkConnector.COUNTER_APP_URL);

        if(!config_ok(config))
            throw new ConfigException("One or more of required prop is null");

        Auth = new ConfidentialAuthService(sso_url, reame, client_id, client_scret, certs);
        //AppCounter = new Counter(counterApp_url, Auth);
        AppCounter = new Counter(counterApp_url);
        
        //String token = CustomSinkConnector.getMyToken();
        token = CustomSinkConnector.getMyToken();
        if (!Auth.verifyToken(token)){
            throw new RetriableException("Invalid token! Stopping SinkConnector");
        }
        
        log.info("Token succesfully verified.");
    }  
    

    private boolean config_ok(AbstractConfig config){
        String sso_url = config.getString(CustomSinkConnector.SSO_URL);
        String reame = config.getString(CustomSinkConnector.RealmName);
        String client_id = config.getString(CustomSinkConnector.CLIENT_ID);
        String client_scret = config.getString(CustomSinkConnector.CLIENT_SECRET);
        //String certs = config.getString(MySinkConnector.CERTS_URL); non è fondamentale
        String counterApp_url = config.getString(CustomSinkConnector.COUNTER_APP_URL);
        if (sso_url == null || reame == null || client_id == null || client_scret == null || counterApp_url == null)
            return false;

        return true;
    }

    @Override
    public void put(Collection<SinkRecord> sinkRecords){
        boolean processed = false;
        for (SinkRecord record : sinkRecords) {
            Struct recordValue = (Struct) record.value();
            if (recordValue!=null){ //Debezium invia un messaggio vuoto dopo aver riconsciuto una DELETE. Questo controllo serve a questo: se il messaggio è vuoto, lo salta
                Struct source = (Struct) recordValue.get("source");
                String table = source.getString("table");

                switch(table){
                    case "NoteList":
                        AppCounter.setOperation("add/list");
                        processNoteList(recordValue);
                        processed = true;
                        break;
                }     
            }       
        }
        if (processed) {
            try {
                if(Auth.isTokenExpired(token))
                    token = Auth.getToken();
                    
                System.out.println("Starting add operation: ");
                AppCounter.add(token);
            } catch (Exception e) {
                log.error(e.getMessage());

                if(e.getMessage().contains("null"))
                    log.info("Nothing to add");
                
                else                     
                    throw new RetriableException("Offset committ will not run");               
            }
        }
    }

    private void processNoteList(Struct recordValue){
        Struct afterStruct = (Struct) recordValue.get("after");
        Struct beforeStruct = (Struct) recordValue.get("before");

        if(afterStruct == null){
            /*
             * se non esiste il campo 'after' vuol dire che è stata fatta una operazione di DELETE. 
             * Esiste solo il campo 'before' che indica il contenuto eliminato.
             */
            log.info("DELETE recognized");
            String noteListJson = (String) beforeStruct.get("NoteList");
            JSONObject noteListObject = new JSONObject(noteListJson);
            JSONArray deleted_itemsArray = noteListObject.getJSONArray("Items");
            JSONArray ja = processItems(deleted_itemsArray, false);

            AppCounter.addOpContent(ja);
        }
        else{
            if (beforeStruct == null){ 
                /*
                 * è presente solo il campo after, dunque è stato inserito un nuovo dato
                 */
                String noteListJson = (String) afterStruct.get("NoteList");
                JSONObject noteListObject = new JSONObject(noteListJson);
                JSONArray itemsArray = noteListObject.getJSONArray("Items");
                JSONArray ja = processItems(itemsArray, true);

                AppCounter.addOpContent(ja);
            }
            else { 
                /*
                 * Sia afterStruct che beforeStruct sono presenti. 
                 * Il che indica che è stata effettuata una modifica.
                 */
                log.info("UPDATE ricognized");
                String noteListJson = (String) beforeStruct.get("NoteList");
                JSONObject noteListObject = new JSONObject(noteListJson);
                JSONArray deleted_itemsArray = noteListObject.getJSONArray("Items");
                JSONArray ja = processItems(deleted_itemsArray, false);
                AppCounter.addOpContent(ja);

                noteListJson = (String) afterStruct.get("NoteList");
                noteListObject = new JSONObject(noteListJson);
                JSONArray itemsArray = noteListObject.getJSONArray("Items");
                ja = processItems(itemsArray, true);

                AppCounter.addOpContent(ja);
            }   
        }
        
    }


    private JSONArray processItems(JSONArray items, boolean increment){
        Map<String, Integer> customerCounter = new HashMap<>();
        Map<String, Integer> colorCounter = new HashMap<>();
        Map<String, Integer> productNCounter = new HashMap<>();
        Map<String, Integer> qualityCounter = new HashMap<>();
        Map<String, Integer> globalCounter = new HashMap<>(); 

        int delta = increment ? 1 : -1; //per gestire i casi in cui Debezium riconosce un INSERT oppure UPDATE o DELETE
        
        Type listType = new TypeToken<List<TraceabilityJsonItem>>() {}.getType();
        List<TraceabilityJsonItem> list_items = new Gson().fromJson(items.toString(), listType);

        
        String date = list_items.get(0).getDate();

        for (TraceabilityJsonItem item : list_items) {
            //Aggiornamento contatori
            if(checkItem(item)){
                customerCounter.put(item.getCustomerCode(), customerCounter.getOrDefault(item.getCustomerCode(), 0) + delta);
                colorCounter.put(item.getProduct().getColorText(), colorCounter.getOrDefault(item.getProduct().getColorText(), 0) + delta);
                productNCounter.put(item.getProduct().getProductNumber(), productNCounter.getOrDefault(item.getProduct().getProductNumber(), 0) + delta);
                if (item.getCheckList() != null) 
                    qualityCounter.put(item.getCheckList().getResult_S(), qualityCounter.getOrDefault(item.getCheckList().getResult_S(), 0) + delta);
                else
                    qualityCounter.put("unknown", qualityCounter.getOrDefault("unknown", 0) + delta);

                globalCounter.put("ITEMS_IN", globalCounter.getOrDefault("ITEMS_IN", 0) + delta);
            }
        }
    
        JSONArray ja = new JSONArray();
        populateJArray(customerCounter, "CNTS_CUSTOMER_CODES", date, ja);
        populateJArray(colorCounter, "CNTS_COLORS", date, ja);
        populateJArray(productNCounter, "CNTS_PNs", date, ja);
        populateJArray(qualityCounter, "CNTS_QUALITY_CHECK", date, ja);
        populateJArray(globalCounter, "CNTS_GLOBAL", date, ja);

        return ja;
    }

    private boolean checkItem(TraceabilityJsonItem item){
        if (item.getCustomerCode() == null || item.getProduct() == null) 
            return false;
        
        if (item.getProduct().getColorText() == null || item.getProduct().getColorText().isEmpty()) 
            item.getProduct().setColorText("unknown");
        
        if (item.getProduct().getProductNumber() == null || item.getProduct().getProductNumber().isEmpty()) 
            item.getProduct().setProductNumber("unknown");
        
        if (item.getCustomerCode().isEmpty()) 
            item.setCustomerCode("unknown");

        if (item.getCheckList() != null) {
            if (item.getCheckList().getResult_B()) {
                item.getCheckList().setResult_S("OK");
            } else {
                item.getCheckList().setResult_S("KO");
            }
        }
       
        return true;
    }


    private void populateJArray(Map<String, Integer> counter, String groupType, String date, JSONArray arrayJS) {
        for (Map.Entry<String, Integer> entry : counter.entrySet()) {
            JSONObject jo = build_jo(entry.getKey(), groupType, SOURCE, date, entry.getValue());
            arrayJS.put(jo);
            }
    }
    

    private JSONObject build_jo(Object name, String group, String source, String date, int quantity){
        JSONObject jo = new JSONObject();
        jo.put("name", name);
        jo.put("group", group); 
        jo.put("source", source);
        jo.put("qta", quantity);

        if (date == null)
            jo.put("_date", date);//non usato
        else 
            jo.put("date", date);
        
        return jo;
    }


    @Override
    public void flush(Map<TopicPartition, OffsetAndMetadata> offsets) {
        log.info("FLUSHING");
    }


    @Override
    public void stop() {
        if (outputStream != null && outputStream != System.out)
            outputStream.close();
    }
}