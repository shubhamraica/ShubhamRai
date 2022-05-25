@isTest
global class MockForNews implements HttpCalloutMock{
    global HTTPResponse respond(HTTPRequest req) {
        String endpoint = req.getEndpoint();
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{"status":"ok","totalResults":38,"articles":[{"source":{"id":null,"name":"News18"},"author":"Lifestyle Desk","title":"S","description":"Strawberry moon will grace the sky on June 24 at 2:40 pm EDT (June 25 at 12:10 am IST).","url":"https://www.news18.com/news/lifestyle/strawberry-moon-2021-when-and-where-to-watch-full-moon-online-in-india-3886568.html","urlToImage":"https://images.news18.com/ibnlive/uploads/2021/06/1624528414_moon-new1-3.jpg","publishedAt":"2021-06-24T09:56:06Z","content":"Strawberry "}]}');
        res.setStatusCode(200);
        return res;
    }
}