@isTest public class SendToWhatsapp_Test {
    @isTest static void getSMSTest(){ 
        Test.startTest(); 
        Test.setMock(HttpCalloutMock.class, new MockForWhatsapp());
        SendToWhatsapp.getSMS();
        Test.stopTest();
    } 
    @isTest static void sendSMSTest(){ 
        Test.startTest(); 
        Test.setMock(HttpCalloutMock.class, new Mock2());
        String MessageBody = 'speedtest by airtel';
        SendToWhatsapp.sendSMS(MessageBody);
        Test.stopTest();
    } 
}