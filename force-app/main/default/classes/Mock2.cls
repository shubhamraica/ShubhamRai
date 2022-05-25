@isTest
global class Mock2 implements HttpCalloutMock{
    global HTTPResponse respond(HTTPRequest req) {
        String endpoint = req.getEndpoint();
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{"sid":"SMf1d2a8d0d24e475cb1860b5ad491056e","date_created":"Tue, 29 Jun 2021 07:03:00 +0000","date_updated":"Tue, 29 Jun 2021 07:03:00 +0000","date_sent":null,"account_sid":"AC525a775ce24489b21767dba68f0f345b","to":"whatsapp:+917042937295","from":"whatsapp:+14155238886","messaging_service_sid":null,"body":"POST https://api.twilio.com/2010-04-01/Accounts/AC525a775ce24489b21767dba68f0f345b/Messages.json    Dont forget to add AUTH TOKEN in password in Authoriazation.\n","status":"queued","num_segments":"1","num_media":"0","direction":"outbound-api","api_version":"2010-04-01","price":null,"price_unit":null,"error_code":null,"error_message":null,"uri":"/2010-04-01/Accounts/AC525a775ce24489b21767dba68f0f345b/Messages/SMf1d2a8d0d24e475cb1860b5ad491056e.json","subresource_uris":{"media":"/2010-04-01/Accounts/AC525a775ce24489b21767dba68f0f345b/Messages/SMf1d2a8d0d24e475cb1860b5ad491056e/Media.json"}}');
        res.setStatusCode(200);
        return res;
    }
}