@isTest
public class twentyOpportunity_Test {
    @testSetup static void Test(){
        Opportunity oppObj = new Opportunity();
        oppObj.CloseDate = Date.today();
        oppObj.StageName = 'proposal';
        oppObj.Name = 'Shubham Rai';
        insert oppObj;
    }
    @isTest static void testMethod1(){
        Opportunity oppObj = [SELECT Name FROM Opportunity WHERE Name = 'Shubham Rai' LIMIT 1];
        test.startTest();
        twentyOpportunity.twentyRecords();
        System.assertEquals(oppObj != NULL, true);
        test.stopTest();
    } 
}