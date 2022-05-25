@isTest
public class SendSMSController_Test {
    @testSetup static void Test(){
        Account accObj = new Account();
        accObj.Name = 'TestName';
        insert accObj;
        
        SMS__c smsobj = new SMS__c();
        smsobj.Phonenumber__c = '1234567890';
        smsobj.Account__c = accObj.Id;
        smsobj.Name = 'MSGBODY';
        smsobj.UserName__c = UserInfo.getName();    
        smsobj.type__c = 'outbound';
        insert smsobj;
    }
    @isTest static void SendSMSTest(){    
        Account accObj = [SELECT Name FROM Account WHERE Name = 'TestName' LIMIT 1]; 
        String MobileNumber = '1234567890';
        String CountryCode = '+91';
        String MessageBody = 'MSG BODY';
        String recordid = accObj.id;
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new MOCK());
        SendSMSController.SendSMS(MobileNumber, CountryCode, MessageBody, recordid);
        Test.stopTest();
    } 
    @isTest static void fetchsmsTest(){    
        Account accObj = [SELECT Name FROM Account WHERE Name = 'TestName' LIMIT 1]; 
        String recordid = accObj.id;
        Test.startTest();
        List<SMS__c> result = SendSMSController.fetchsms(recordid);
        System.assertEquals(result != NULL, true);
        Test.stopTest();
    }
    @isTest static void fetchOtherTest(){    
        Account accObj = [SELECT Name FROM Account WHERE Name = 'TestName' LIMIT 1]; 
        String recordid = accObj.id;
        Test.startTest();
        List<SMS__c> result = SendSMSController.fetchOther(recordid);
        System.assertEquals(result != NULL, true);
        Test.stopTest();
    }
    @isTest static void fetchNearestTest(){    
        Account accObj = [SELECT Name FROM Account WHERE Name = 'TestName' LIMIT 1]; 
        
        String recordid = accObj.id;
        
        Test.startTest();
        List<SMS__c> result = SendSMSController.fetchNearest(recordid);
        System.assertEquals(result != NULL, true);
        Test.stopTest();
    } 
    @isTest static void fetchPatientTest(){    
        Account accObj = [SELECT Name FROM Account WHERE Name = 'TestName' LIMIT 1]; 
        String recordid = accObj.id;
        Test.startTest();
        List<SMS__c> result = SendSMSController.fetchPatient(recordid);
        System.assertEquals(result != NULL, true);
        Test.stopTest();
    } 
    @isTest static void getPatientPhoneTest(){    
        Account accObj = [SELECT Name FROM Account WHERE Name = 'TestName' LIMIT 1]; 
        String recordid = accObj.id;
        Test.startTest();
        Account result = SendSMSController.getPatientPhone(recordid);
        System.assertEquals(result != NULL, true);
        Test.stopTest();
    } 
    @isTest static void getOtherPhoneTest(){    
        Account accObj = [SELECT Name FROM Account WHERE Name = 'TestName' LIMIT 1]; 
        String recordid = accObj.id;
        Test.startTest();
        Account result = SendSMSController.getOtherPhone(recordid);
        System.assertEquals(result != NULL, true);
        Test.stopTest();
    } 
    @isTest static void getNerarestPhoneTest(){    
        Account accObj = [SELECT Name FROM Account WHERE Name = 'TestName' LIMIT 1]; 
        String recordid = accObj.id;
        Test.startTest();
        Account result = SendSMSController.getNerarestPhone(recordid);
        System.assertEquals(result != NULL, true);
        Test.stopTest();
    } 
}