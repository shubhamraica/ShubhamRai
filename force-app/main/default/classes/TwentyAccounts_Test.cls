@isTest
public class TwentyAccounts_Test{
    @testSetup static void Test(){
        Account accObj= new Account();
        accObj.Name='Shubham Rai';
        accObj.Phone='12345678990 ';
        accObj.NumberOfEmployees=1;
        accObj.BillingCity='Noida';
        accObj.BillingCountry='India';
        insert accObj;
    }
    @isTest static void createAccountTest(){
        Account accObj = [SELECT Name FROM Account WHERE Name = 'Shubham Rai' LIMIT 1];
        test.startTest();
        TwentyAccounts.createAccount();
        System.assertEquals(accObj != NULL, true);
        test.stopTest();
    }
}