@isTest
public class TwilioReceiveSMS_Test {
    @isTest static void TwilioReceiveSMSTest(){    
        RestRequest req = new RestRequest(); 
        RestResponse res = new RestResponse();
        req.requestURI = '/services/apexrest/TwilioReceiveSMS'; 
        req.httpMethod = 'Post';
        req.addHeader('Content-Type', 'application/json'); 
        RestContext.request = req;
        RestContext.response = res; 
        
        RestContext.request.params.put('From', '8287571846');
        RestContext.request.params.put('Body', 'SMSBODY');
        
        Account accObj = new Account();
        accObj.Name = 'TestName';
        accObj.PatientCellPhone__c = '8287571846';
        accObj.OtherPhone__c = '8287571846';
        accObj.NearestRelativeCaregiverPhone__c = '8287571846';
        insert accObj; 
        
        SMS__c smsobj = new SMS__c();
        smsobj.Name = 'smsBody';
        smsobj.phoneNumber__c = '8287571846';
        smsobj.Account__c = accObj.Id;
        smsobj.type__c = 'inbound';
        smsobj.UserName__c = UserInfo.getName();   
        insert smsobj;
        
        Test.startTest();
        TwilioReceiveSMS.getSMS();
        Test.stopTest();
    }
}