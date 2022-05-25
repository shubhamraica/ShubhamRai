@isTest
public class UpdateOpportunity_Test{
    @isTest static void testMethod1(){
        Opportunity opp = new Opportunity();
        opp.Name = 'testName';
        opp.StageName = 'Closed Won';
        opp.CloseDate = date.today().addDays(10);
        insert opp;
        Opportunity testOpp = new Opportunity();
        testOpp = [SELECT Name, StageName, CloseDate FROM Opportunity WHERE Name = 'testName'];
        UpdateOpportunity.UpdateRecords();
    }
}