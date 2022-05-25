//Create Batch class to create 5 new Opportunities daily.
global class FiveOpportunitiesDaily Implements Database.Batchable <Sobject>{
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('Select Id FROM opportunity LIMIT 1');
    }
    global void execute(Database.BatchableContext bc, List<Opportunity> opprList){
        List<Opportunity> oppr = new List<Opportunity>();
        for(Integer i=1;i<=5;i++){
            Opportunity OpprObj = new Opportunity();
            OpprObj.Name = 'Opportunity Name '+i;
            OpprObj.StageName = 'something';
            opprObj.CloseDate = date.today().addDays(1);
            oppr.add(OpprObj);
        }
        insert oppr;
    }
    global void finish(Database.BatchableContext bc){
        System.debug('5 OPPORTUNITIES CREATED');
    }
}