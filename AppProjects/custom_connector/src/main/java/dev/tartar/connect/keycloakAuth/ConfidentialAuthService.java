package dev.tartar.connect.keycloakAuth;

import java.net.URI;
import java.net.URL;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

import java.security.interfaces.RSAPublicKey;
import java.util.Calendar;
import java.util.concurrent.Semaphore;

import com.auth0.jwk.JwkProvider;
import com.auth0.jwk.UrlJwkProvider;
import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;

import dev.tartar.connect.CustomSinkConnector;

import com.auth0.jwk.Jwk;

import org.json.JSONObject;

import javax.ws.rs.core.Response.Status.Family;

public class ConfidentialAuthService {
    private Semaphore semaphore;
    private String access_token; 
    private String sso_url;
    private String RealmName;
    private String Client_id;
    private String Client_secret;
    private String certs_url;
    private StringBuilder uri_request;

    public ConfidentialAuthService(String ssoURL, String RealmName, String client_id, String client_secret, String certs_url){
        this.sso_url = ssoURL;
        this.RealmName = RealmName;
        this.Client_id = client_id;
        this.Client_secret = client_secret;
        this.certs_url = certs_url;
        this.uri_request = new StringBuilder();
        this.access_token = CustomSinkConnector.getMyToken();
        semaphore = new Semaphore(1);
    }

    public String getToken() throws Exception{
        try {
            if (semaphore.tryAcquire()){
                access_token = getTokenCore();
                semaphore.release();
                return access_token;
            }
        } catch (Exception e) {
            semaphore.release();
            throw (e);
        }
        return null;
    }


    private String getTokenCore() throws Exception{
        if (access_token==null  || isTokenExpired(access_token))
            getAccessToken();
        
        return access_token;
    }


    private void getAccessToken() throws Exception{
        clearTokens();
        JSONObject responseBody;
        String tokenUri = sso_url + "/auth/realms/" + RealmName + "/protocol/openid-connect/token";
     
        String grant_type = "grant_type=client_credentials";
        String scope = "scope=openid";

        uri_request.append("client_id=").append(Client_id).append("&");
        uri_request.append("client_secret=").append(Client_secret).append("&");
        uri_request.append(grant_type).append("&");
        uri_request.append(scope);


        HttpRequest request = HttpRequest.newBuilder()
        .uri(URI.create(tokenUri))
        .header("Accept", "*/*")
        .header("Content-Type", "application/x-www-form-urlencoded")
        .method("POST", HttpRequest.BodyPublishers.ofString(uri_request.toString()))
        .build();
        
        HttpResponse<String> response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
        if (Family.familyOf(response.statusCode()) == Family.SUCCESSFUL){
            responseBody = new JSONObject(response.body());
            this.access_token = responseBody.getString("access_token");
            /*
             * pulizia della strina contenente la richiesta  
             */
            uri_request.setLength(0);
        }
        else throw new Exception("ERROR: "+response.statusCode());
    }


    public boolean isTokenExpired(String token){
        boolean expired = false;
        if (token != null){
            DecodedJWT decodedJwt = JWT.decode(token);
            if(decodedJwt.getExpiresAt().before(Calendar.getInstance().getTime())) {
                //System.out.println("Expired token!");
                expired=true;
            }
        }
        
        return expired;
    }


    public boolean verifyToken(String token) {
        boolean token_valid = false;
        if (token != null){
            DecodedJWT decodedJwt = JWT.decode(token);
            try {
                //URL is deprecated. Must use URI then convert to URL
                if (certs_url != null){
                    String certs = certs_url + "/realms/" + RealmName + "/protocol/openid-connect/certs";
                    URI uri = new URI(certs);
                    URL url = uri.toURL();
                    JwkProvider provider = new UrlJwkProvider(url, 3000, 3000);
                    Jwk jwk_url = provider.get(decodedJwt.getKeyId());
                    Algorithm algorithm = Algorithm.RSA256((RSAPublicKey) jwk_url.getPublicKey(), null);
                    algorithm.verify(decodedJwt);
                }  
                token_valid = true;
            } catch (Exception e) {
                System.out.println(e);
            }
        }
        return token_valid;
    }

    private void clearTokens(){
        access_token = null;
    }
}
