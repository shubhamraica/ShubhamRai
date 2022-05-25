//8Create Batch to update the Account "Count" field(Create this field) with all the contacts related to that Account.
global class UpdateCountFieldInAccount Implements Database.Batchable <Sobject>{
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('SELECT count__c,(SELECT ID from contacts) FROM Account');
    }
    global void execute(Database.BatchableContext bc, List<Account> accList){
        for(Account eachAccount : accList){
            eachAccount.count__c = eachAccount.Contacts.size();
        }
        update accList;
    }
    global void finish(Database.BatchableContext bc){
        System.debug('DONE');
    }
}