package dev.tartar.connect;

import org.apache.kafka.common.config.AbstractConfig;
import org.apache.kafka.common.config.ConfigDef;
import org.apache.kafka.common.config.ConfigDef.Importance;
import org.apache.kafka.common.config.ConfigDef.Type;
import org.apache.kafka.common.utils.AppInfoParser;
import org.apache.kafka.connect.connector.Task;
import org.apache.kafka.connect.errors.ConnectException;
import org.apache.kafka.connect.errors.RetriableException;
import org.apache.kafka.connect.sink.SinkConnector;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dev.tartar.connect.keycloakAuth.ConfidentialAuthService;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


public class CustomSinkConnector extends SinkConnector {

    private static final Logger log = LoggerFactory.getLogger(CustomSinkConnector.class);
    public static final String SSO_URL = "sso.url";
    public static final String RealmName = "realm.name";
    public static final String CLIENT_ID = "client.id";
    public static final String CLIENT_SECRET = "client.secret";
    public static final String CERTS_URL = "certs.url";
    public static final String COUNTER_APP_URL = "counter.app.url";
    private static String token = null;

    private static ConfidentialAuthService Auth;

    static final ConfigDef CONFIG_DEF = new ConfigDef()
        .define(SSO_URL, Type.STRING, null, Importance.HIGH, "SSO url")
        .define(RealmName, Type.STRING, null, Importance.HIGH, "Nome del reame sul quale richiedere l'autenticazione")
        .define(CLIENT_ID, Type.STRING, null, Importance.HIGH, "ID del Client confidenziale")
        .define(CLIENT_SECRET, Type.STRING, null, Importance.HIGH, "Segreto del client confidenziale")
        .define(CERTS_URL, Type.STRING, null, Importance.HIGH, "Certs url")
        .define(COUNTER_APP_URL, Type.STRING, null, Importance.HIGH, "Counter's App url");

    private Map<String, String> props;

    @Override
    public String version() {
        return AppInfoParser.getVersion();
    }

    @Override
    public void start(Map<String, String> props){
        this.props = props;

        AbstractConfig config = new AbstractConfig(CONFIG_DEF, props);
        String base_url = config.getString(SSO_URL);
        String reame = config.getString(RealmName);
        String client_id = config.getString(CLIENT_ID);
        String client_scret = config.getString(CLIENT_SECRET);
        String certs = config.getString(CERTS_URL);
        Auth = new ConfidentialAuthService(base_url, reame, client_id, client_scret, certs);

        try {
            token = Auth.getToken();
        } catch (Exception e) {
            log.error("Failed to get token. Details: "+ e.getMessage(), e);
            throw new RetriableException("Failed to get token");
        } 
        if (token == null){
            log.error("Token is null!");
            throw new RetriableException("Token is null!");
        }
        log.info("Token received...");
        log.info("Connector started"); 
    }

    @Override
    public Class<? extends Task> taskClass() {
        return CustomSinkConnectorTask.class;
    }

    @Override
    public List<Map<String, String>> taskConfigs(int maxTasks) {
        ArrayList<Map<String, String>> configs = new ArrayList<>();
        for (int i = 0; i < maxTasks; i++) {
            configs.add(props);
        }
        return configs;
    }

    @Override
    public void stop() {
        log.info("Stopping connector...");
        throw new ConnectException("");
    }

    @Override
    public ConfigDef config() {
        return CONFIG_DEF;
    }

    public static String getMyToken(){
        return token;
    }
}