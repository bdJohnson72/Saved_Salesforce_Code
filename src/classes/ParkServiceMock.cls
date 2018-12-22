@isTest
Global class ParkServiceMock implements WebServiceMock{
    global void doInvoke(
    	Object stub,
    	Object request,
    	Map<String, Object> response,
    	String endpoint,
    	String requestName,
    	String soapAction,
    	String responseNS,
    	String responseType,
        String responseName){
            parkService.byCountryResponse response_x = new parkService.byCountryResponse();
            response_x.return_x = new List<String>{'Me', 'You', 'Him'};
                response.put('response_x', response_x);
        }   

}