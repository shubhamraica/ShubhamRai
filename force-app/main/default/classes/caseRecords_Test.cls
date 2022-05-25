@isTest
public class caseRecords_Test {
    /*@isTest static void testMethod1(){
        Account accObj = new Account();
        accObj.Name = 'testName';
        accObj.NumberOfEmployees = 1;
        insert accObj;
        Contact conObj = new Contact();
        conObj.LastName = 'testLastName';
        conObj.AccountId = AccObj.Id;
        insert conObj;
        Case caseObj = new Case();
        caseObj.AccountId = accObj.Id;
        caseObj.ContactId = conObj.Id;
        insert caseObj;
        caseRecords.createFiveCaseRecord();
    }*/
    @isTest public static void testMethod1(){
        Account accObj = new Account();
        accObj.Name = 'testName';
        accObj.NumberOfEmployees = 1;
        insert accObj;
        
        Account accObj2 = new Account();
        accObj2.Name = 'testName2';
        accObj2.NumberOfEmployees = 2;
        insert accObj2;
        
        List<Account> account3 = new List<Account>();
        account3.add(accObj);
        account3.add(accObj2);
        
        OpportunityTriggerHandler.AccountVerification(account3);
		OpportunityTriggerHandler.REIError(account3);
    }
}