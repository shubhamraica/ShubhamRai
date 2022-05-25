@istest
public class policyHandler_test {
    @istest
    static void policyHandler_testmethod()
    {
        Opportunity opp=new Opportunity();
        opp.Name='gupta';
        opp.StageName='closedwon';
        opp.CloseDate=date.today().adddays(1);
        opp.policy_number__c=15;
        insert opp;
        policy__c policyobj=new policy__c();
        Policyobj.Name='new policy';
        policyobj.policy_number__c=10;
        policyobj.renew_policy__c=true;
        insert policyobj;
        policy__c policyobj1=new policy__c();
        Policyobj1.Name='new policy1';
        policyobj1.policy_number__c=15;
        policyobj1.renew_policy__c=true;
        update policyobj;
    }
}