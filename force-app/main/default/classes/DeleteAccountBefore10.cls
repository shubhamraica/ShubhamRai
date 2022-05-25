//2.Write a Batch class to delete accounts created in 10 days before.
global class DeleteAccountBefore10 Implements Database.Batchable <Sobject>{
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('Select Id,createdDate from Account where CreatedDate <= LAST_N_DAYS:1');
    }
    global void execute(Database.BatchableContext bc, List<Account> accList){
        Delete accList;     
    }
    global void finish(Database.BatchableContext bc){
        System.debug('Accounts created in last 10 days are deleted');
    }
}