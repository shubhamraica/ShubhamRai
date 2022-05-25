global class FetchLeadAndSendMail Implements Database.Batchable <Sobject>{
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('Select id,Lastname,Company,CreatedDate from  Lead where CreatedDate = today');
    }
    global void execute(Database.BatchableContext bc, List<Lead> leadList){
        String namesoflead='';
        for(lead eachLead:leadlist){
            namesoflead = namesoflead +eachLead.lastname + '\n';
        }
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();//messaging obj
        String[] toAddresses = new String[] {userinfo.getUserEmail()};//address string
        mail.setToAddresses(toAddresses);
        mail.setSubject('lead');//subject
        mail.setPlainTextBody('lead name>>'+namesoflead);//body
        Messaging.SendEmailResult[] results = Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
    global void finish(Database.BatchableContext bc){
        System.debug('DONE');
    }
}