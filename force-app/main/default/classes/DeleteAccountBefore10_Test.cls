@isTest
public class DeleteAccountBefore10_Test {
    @isTest static void testMethod1(){
        Account accObj = new Account();
        accObj.Name ='testName22';
        accObj.NumberOfEmployees = 1;
        insert accObj;
        Account accObj2 = [SELECT id, Name FROM Account WHERE Name = 'testName22'];
        delete accObj2;
        Test.startTest();
        DeleteAccountBefore10 obj = new DeleteAccountBefore10();
        DataBase.executeBatch(obj);         
        Test.stopTest();
    }
}