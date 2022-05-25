@isTest
public class triggerOnProduct_Test {
    @isTest static void testMethod1(){
        PriceBookEntry pbeObj = new PriceBookEntry();
        pbeObj.UnitPrice=1;    
        Database.SaveResult result = Database.insert(pbeObj, false);
        System.assert(!result.isSuccess());
    }
}