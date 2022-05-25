@RestResource(urlMapping='/WAReceive/*')
global class WAreceive {
    @HttpPost
    global static void getWASMS() {
        RestRequest req =RestContext.request;
        RestResponse res = RestContext.response;
        Map<String, String> sms = req.params ; 
        System.debug('sms : '+sms.get('Body'));
        if(sms.get('Body') != NULL && String.isNotEmpty(sms.get('Body'))){
            System.debug('log inside if');
            WAwebhook__e obj = new WAwebhook__e();
            obj.chatReceived__c = true;
            eventbus.publish(obj);
        }
        Map<String, String> newMap = new Map<String, String>();
        newMap.put('success', 'true');
        res.statusCode = 200;
        res.responseBody = Blob.valueOf(Json.serialize(newMap));
    }
}