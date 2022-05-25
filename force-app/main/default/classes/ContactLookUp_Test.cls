@isTest
public class ContactLookUp_Test {
    @testSetup static void Test(){
        Account accObj= new Account();
        accObj.Name='Shubham Rai';
        accObj.NumberOfEmployees=1;        
        insert accObj;
        Contact conObj = new Contact();
        conObj.LastName = 'testLastName';
        conObj.AccountID = accObj.Id;
        insert conObj;
    }
    @isTest static void testMethod1(){
        //Account accObj = [SELECT Name FROM Account WHERE Name = 'Shubham Rai' LIMIT 1];
        //Contact conObj = [SELECT LastName FROM Contact WHERE LastName = 'testLastName' LIMIT 1];
        test.startTest();
        contactLookUp.contactLookUpFunc();
        //System.assertEquals(conObj != NULL, true);
        test.stopTest();
    }
}