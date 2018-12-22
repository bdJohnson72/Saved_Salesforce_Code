/**
 * Created by Owner on 11/23/2018.
 */

public with sharing class AnimalsCallouts {

    public static httpResponse makeGetCallout(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        //If the request is successful parse the JSON
        if (response.getStatusCode() == 200) {
            //deserialize  the JSON into primitives
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            //cast values in animals key as a list
            List<Object> animals = (List<Object>) results.get('animals');
            for (Object animal : animals){
                system.debug(animal);
            }

        }
        return response;
    }

    public static HttpResponse makePostCallout() {

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('Post');
        request.setHeader('Content-Type', 'Application/JSON;charset=UTF-8');
        request.setBody('{"name" : "Mighty Moose"}');
        HttpResponse response = http.send(request);
        //parse JSON response
        if (response.getStatusCode() != 200) {
            system.debug('The state code returned was not expected'
            + response.getStatusCode() + ' ' +  response.getStatus());

        }else {
            System.debug(response.getBody());
        }
        return response;
    }

}