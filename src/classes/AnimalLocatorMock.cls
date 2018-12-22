/**
 * Created by Owner on 11/24/2018.
 */

@istest

global class AnimalLocatorMock implements HttpCalloutMock{
    global HttpResponse respond(HttpRequest request) {
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"animal": {"id":1, "name":"cow", "eats":"grass"}}');
        response.setStatusCode(200);
        return response;
    }


}