/**
 * Created by Owner on 11/23/2018.
 */

public with sharing class AnimalLocator {

    public static String getAnimalNameById(Integer Id){

        Http http = new Http( );
        HttpRequest  request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + Id);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        String strResp = '';
        System.debug('response' +response.getStatusCode());
        System.debug('response' + response.getBody());


        if (response.getStatusCode() == 200) {
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            Map<String, Object> animals = (Map<String, Object>) results.get('animal');
            System.debug('Recieved the following animals:' + animals);
            strResp = String.valueOf(animals.get('name'));
            System.debug('strResp'  + strResp);
    }
        return strResp;

}
}