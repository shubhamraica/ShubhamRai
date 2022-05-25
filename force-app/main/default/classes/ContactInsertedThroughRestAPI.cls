@RestResource(urlMapping = '/createContact')
global without sharing class ContactInsertedThroughRestAPI{
    @HttpPost
    global static void doGetContactRecord() {
        system.debug('in method');
        RestRequest req = RestContext.request;
        String body = req.requestBody.toString();
        List<Contact> conList = new List<Contact>();
        conList = (List<Contact>) JSON.deserialize(body, List<Contact>.class);
        system.debug('conList'+conList);
        RestContext.response.addHeader('Content-Type', 'application/json');
        RestContext.response.responseBody = Blob.valueOf('Lead Inserted');
        insert conList;
    }
}