@isTest
global class MockForWhatsapp implements HttpCalloutMock{
    global HTTPResponse respond(HTTPRequest req) {
        String endpoint = req.getEndpoint();
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{"first_page_uri":"/2010-04-01/Accounts/AC525a775ce24489b21767dba68f0f345b/Messages.json?PageSize=50&Page=0","end":49,"previous_page_uri":null,"messages":[{"body":"Shubham","num_segments":"1","direction":"inbound","from":"whatsapp:+918882545870","date_updated":"Wed, 30 Jun 2021 06:22:46 +0000","price":null,"error_message":null,"uri":"/2010-04-01/Accounts/AC525a775ce24489b21767dba68f0f345b/Messages/SMa835d2a8dffeb7c6b2eb62542b8c4851.json","account_sid":"AC525a775ce24489b21767dba68f0f345b","num_media":"0","to":"whatsapp:+14155238886","date_created":"Wed, 30 Jun 2021 06:22:44 +0000","status":"received","sid":"SMa835d2a8dffeb7c6b2eb62542b8c4851","date_sent":"Wed, 30 Jun 2021 06:22:46 +0000","messaging_service_sid":null,"error_code":null,"price_unit":"USD","api_version":"2010-04-01","subresource_uris":{"media":"/2010-04-01/Accounts/AC525a775ce24489b21767dba68f0f345b/Messages/SMa835d2a8dffeb7c6b2eb62542b8c4851/Media.json","feedback":"/2010-04-01/Accounts/AC525a775ce24489b21767dba68f0f345b/Messages/SMa835d2a8dffeb7c6b2eb62542b8c4851/Feedback.json"}}],"uri":"/2010-04-01/Accounts/AC525a775ce24489b21767dba68f0f345b/Messages.json?PageSize=50&Page=0","page_size":50,"start":0,"next_page_uri":"/2010-04-01/Accounts/AC525a775ce24489b21767dba68f0f345b/Messages.json?PageSize=50&Page=1&PageToken=PASM9f581cddea984d75b4fb1ca07117e15e","page":0}');
        res.setStatusCode(200);
        return res;
    }
}