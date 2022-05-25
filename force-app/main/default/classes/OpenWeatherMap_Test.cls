@isTest public class OpenWeatherMap_Test {
    @isTest static void SendSMSTest(){ 
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new MockForWeather());
        String city = 'Delhi';
        OpenWeatherMap.getWeather(city);
        Test.stopTest();
    } 
}