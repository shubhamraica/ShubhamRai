@isTest
public class FiveOpportunitiesDaily_Test {
    @isTest static void testMethod1(){
        Opportunity opp=new Opportunity();
        opp.Name='daily';
        opp.StageName='Prospecting';
        opp.CloseDate=date.today().addDays(1);
        insert opp; 
        FiveOpportunitiesDaily batchobj=new FiveOpportunitiesDaily();
        database.executeBatch(batchobj);
    }
}