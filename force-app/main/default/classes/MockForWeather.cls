@isTest
global class MockForWeather implements HttpCalloutMock{
    global HTTPResponse respond(HTTPRequest req) {
        String endpoint = req.getEndpoint();
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{"coord":{"lon":129.7331,"lat":62.0339},"weather":[{"id":801,"main":"Clouds","description":"few clouds","icon":"02n"}],"base":"stations","main":{"temp":297.13,"feels_like":296.89,"temp_min":297.13,"temp_max":297.13,"pressure":1001,"humidity":50},"visibility":10000,"wind":{"speed":3,"deg":270},"clouds":{"all":20},"dt":1624459686,"sys":{"type":1,"id":8854,"country":"RU","sunrise":1624383023,"sunset":1624454158},"timezone":32400,"id":2013159,"name":"Yakutsk","cod":200}');
        res.setStatusCode(200);
        return res;
    }
}