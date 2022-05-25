@isTest
public class triggerOnOpportunity_Test {
    @isTest static void testMethod1(){
        Opportunity oppObj = new Opportunity();
        oppObj.StageName = 'Qualification';
        oppObj.CloseDate = date.today().addDays(1);
        
        Database.SaveResult result = Database.insert(oppObj, false);
    }
}