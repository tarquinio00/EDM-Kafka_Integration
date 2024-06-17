package dev.tartar.connect.counterApp;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

import org.apache.kafka.connect.errors.ConnectException;

import org.json.JSONArray;
import org.json.JSONObject;

import javax.ws.rs.core.Response.Status.Family;


public class Counter {
    private String app_url;
    private String op;
    private JSONArray op_content_array;
    private StringBuilder op_request;

    public Counter(String app_url){
        this.app_url = app_url;
        this.op_request = new StringBuilder();
        this.op_content_array = new JSONArray();
    };
    

    public void add(String token) throws Exception {
        if (op != null) {
            // La stringa contenente la richiesta viene svuotata per essere certi del suo futuro contenuto
            op_request.setLength(0);
            // Composizione della stringa per la richiesta da mandare all'App Counter 
            op_request.append(app_url)
                    .append("/app/cnts/be/")
                    .append(op);

            // Gestione dei casi "add/list" e "add"
            if (op.contains("list")) {
                while (op_content_array.length() != 0) {
                    JSONArray op_content = op_content_array.getJSONArray(0);
                    delete_json_element(0);
                    try {
                        sendRequest(op_request.toString(), token, op_content);
                    } catch (Exception e) {
                        throw e;
                    }
                }
            } 
            else if (op.equals("add")) {
                while (op_content_array.length() != 0) {
                    JSONObject op_content = op_content_array.getJSONObject(0);
                    delete_json_element(0);
                    try {
                        sendRequest(op_request.toString(), token, op_content);
                    } catch (Exception e) {
                        throw e;
                    }
                }
            } 
            else {
                throw new ConnectException("ERROR: unknown operation type");
            }

            System.out.println("Operation successfully executed.");
        } else {
            throw new ConnectException("ERROR: null operation");
        }
    }

    private void sendRequest(String url, String token, Object content) throws Exception {
        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create(url))
                .header("Accept", "*/*")
                .header("Content-Type", "application/json")
                .header("Authorization", "Bearer " + token)
                .method("POST", HttpRequest.BodyPublishers.ofString(content.toString()))
                .build();

        HttpResponse<String> response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());

        if (!(Family.familyOf(response.statusCode()) == Family.SUCCESSFUL)) {
            String responseBody = response.body();
            System.out.println(responseBody);
            System.out.println("JSON error: " + content);
            throw new Exception(String.valueOf(response.statusCode()));
        } 
    }

    public void setOperation(String op){
        this.op = op;
    }

    public String getOperation(){
        return this.op;
    }

    public void addOpContent(JSONArray op_content){
        this.op_content_array.put(op_content);
    }

    private void delete_json_element(int index){
        JSONArray temp_array = new JSONArray();
        for(int i = 0; i < op_content_array.length(); i++){
            if (i!= index)
                temp_array.put(op_content_array.get(i));
        }
        op_content_array = temp_array;
    }
}
