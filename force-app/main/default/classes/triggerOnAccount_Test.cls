@isTest
public class triggerOnAccount_Test {
    @isTest static void testMethod1(){
        Account accObj = new Account();
        accObj.Name = 'testName';
        accObj.NumberOfEmployees = 1;
        insert accObj;
        Database.SaveResult result = Database.insert(accObj, false);
    }
}