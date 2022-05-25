@isTest
public class tenProducts_Test {
    @testSetup static void Test(){
        Product2 prodObj=new Product2();
        prodObj.Name='productName';
        prodObj.Family='productType';
        prodObj.Description='This is description ';
        insert prodObj;
    }
    @isTest static void testMethod1(){
        Product2 prodObj = [SELECT Name FROM Product2 WHERE Name = 'productName' LIMIT 1];
        test.startTest();
        TenProducts.productRecord();
        System.assertEquals(prodObj != NULL, true);
        test.stopTest();
    } 
}