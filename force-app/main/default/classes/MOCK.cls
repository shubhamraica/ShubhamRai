@isTest
global class MOCK implements HttpCalloutMock{
    global HTTPResponse respond(HTTPRequest req) {
        String endpoint = req.getEndpoint();
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('[{"To": "8287571846", "From": "7042937295", "Body": "body"}]');
        res.setStatusCode(200);
        return res;
    }
}