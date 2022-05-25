@isTest public class News_Test {
    @isTest static void SendSMSTest(){ 
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new MockForNews());
        String Country = 'in';
        News.getNews(Country);
        Test.stopTest();
    } 
}