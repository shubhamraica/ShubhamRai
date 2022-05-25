public class RelatedRecordsControlller {
    @AuraEnabled(cacheable=true)
    public static relatedObjectsListWrapper fetchRelatedRecords(String apiName, String recordId){
        try {
            List<Account> relatedAccList = new List<Account>();
            List<Contact> relatedConList = new List<Contact>();
            List<Opportunity> relatedOppList = new List<Opportunity>();
            List<Task> relatedTaskList = new List<Task>();
            List<Case> relatedCaseList = new List<Case>();

            if(apiName == 'Account'){
                relatedAccList = [SELECT Name FROM Account WHERE ParentId =:recordId LIMIT 10];   
                relatedConList = [SELECT Name, Email, Phone FROM Contact WHERE AccountId =:recordId LIMIT 10];   
                relatedOppList = [SELECT Name, StageName, Amount FROM Opportunity WHERE AccountId =:recordId LIMIT 10]; 
                relatedTaskList = [SELECT Id, Subject FROM Task WHERE WhoId =:recordId LIMIT 3];           
                relatedCaseList = [SELECT Id, Status, Priority, CaseNumber  FROM Case WHERE AccountId =:recordId LIMIT 10];           
            }

            relatedObjectsListWrapper wrapperObj = new relatedObjectsListWrapper();
            if(relatedAccList != NULL && relatedAccList.size()>0){
                wrapperObj.relatedAccList = relatedAccList;
            }if(relatedConList != NULL && relatedConList.size()>0){
                wrapperObj.relatedConList = relatedConList;
            }if(relatedOppList != NULL && relatedOppList.size()>0){
                wrapperObj.relatedOppList = relatedOppList;
            }if(relatedTaskList != NULL && relatedTaskList.size()>0){
                wrapperObj.relatedTaskList = relatedTaskList;
            }if(relatedCaseList != NULL && relatedCaseList.size()>0){
                wrapperObj.relatedCaseList = relatedCaseList;
            }
            return wrapperObj;
        } catch (Exception e) {
            system.debug(e.getMessage()+'  AT LINE NO '+e.getLineNumber());
            return NULL;
        }
    }

    @AuraEnabled
    public static void sendMail(List<String> selectedRecordsIds){
        try {
            String emailBody = '<table style="width: 100%;font-family: arial, sans-serif;border-collapse: collapse;"> <tr style=" background-color: #f5f5f5;"> <th style=" border: 1px solid #dddddd;text-align: left;padding: 8px;width:32.5%;">NAME</th> <th style=" border: 1px solid #dddddd;text-align: left;padding: 8px;width:32.5%;">EMAIL</th> <th style=" border: 1px solid #dddddd;text-align: left;padding: 8px;width:32.5%;">PHONE</th> </tr></table>';
            if(selectedRecordsIds.get(0).startsWith('003')){
                for(String each : selectedRecordsIds){
                    contact conObj = new Contact();
                    conObj = [Select id,Name, Email, Phone FROM Contact Where Id=:each];
                    emailBody = emailBody+ '<table style="width: 100%;font-family: arial, sans-serif;border-collapse: collapse;"> <tr style=" background-color: #fff;"> <th style=" border: 1px solid #dddddd;text-align: left;padding: 8px;width:32.5%;">'+conObj.Name+'</th> <th style=" border: 1px solid #dddddd;text-align: left;padding: 8px;width:32.5%;">'+conObj.Email+'</th> <th style=" border: 1px solid #dddddd;text-align: left;padding: 8px;width:32.5%;">'+conObj.Phone+'</th> </tr></table>';
                }
            }else if(selectedRecordsIds.get(0).startsWith('001')){
                for(String each : selectedRecordsIds){
                    Account accObj = new Account();
                    accObj = [Select id FROM Account Where Id=:each];
                }
            }else if(selectedRecordsIds.get(0).startsWith('500')){
                for(String each : selectedRecordsIds){  
                    Case caseObj = new Case();
                    caseObj = [Select id FROM Case Where Id=:each];
                }
            }else if(selectedRecordsIds.get(0).startsWith('00T')){
                for(String each : selectedRecordsIds){
                    Task taskObj = new Task();
                    taskObj = [Select id FROM Task Where Id=:each];
                }
            }else if(selectedRecordsIds.get(0).startsWith('006')){
                for(String each : selectedRecordsIds){
                    Opportunity oppObj = new Opportunity();
                    oppObj = [Select id FROM Opportunity Where Id=:each];
                }
            }

            List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            String userName = UserInfo.getUserName();
            User activeUser = [Select Email From User where Username = : userName limit 1];
            String userEmail = activeUser.Email;
            List<String> emailAddresses = new List<String>();
            emailAddresses.add(userEmail);
            mail.setToAddresses(emailAddresses);
            mail.setReplyTo('shubham.rai@cloudanalogy.com');
            mail.setSenderDisplayName('Shubham Rai');
            mail.setSubject('Email Subject');
            mail.setHtmlBody(emailBody);
            mails.add(mail);
            Messaging.sendEmail(mails);
        } catch (Exception e) {
            system.debug('class : RelatedRecordsControlller, method : sendMail. '+e.getMessage()+'  AT LINE NO '+e.getLineNumber());
        }
    }

    @AuraEnabled
    public static Void delRecords(List<String> recordsToDel){
        try {
            List<Contact> conListToDel = new List<Contact>();
            List<Opportunity> oppListToDel = new List<Opportunity>();
            List<Case> caseListToDel = new List<Case>();

            for(String each : recordsToDel){
                if(each.startsWith('003')){
                    contact conObj = new Contact();
                    conObj = [Select id FROM Contact Where Id=:each];
                    conListToDel.add(conObj);
                }if(each.startsWith('500')){
                    Case caseObj = new Case();
                    caseObj = [Select id FROM Case Where Id=:each];
                    caseListToDel.add(caseObj);
                }if(each.startsWith('006')){
                    Opportunity oppObj = new Opportunity();
                    oppObj = [Select id FROM Opportunity Where Id=:each];
                    oppListToDel.add(oppObj);
                }
            }
            
            delete conListToDel;
            delete oppListToDel;
            delete caseListToDel;   
        } catch (Exception e) {
            system.debug('class : RelatedRecordsControlller, method : delRecords. '+e.getMessage()+'  AT LINE NO '+e.getLineNumber());
            throw new AuraHandledException(e.getMessage());      

        }
    }

    public class relatedObjectsListWrapper {
        @AuraEnabled
        public List<Account> relatedAccList;
        @AuraEnabled
        public List<Contact> relatedConList;
        @AuraEnabled
        public List<Opportunity> relatedOppList;
        @AuraEnabled
        public List<Task> relatedTaskList;
        @AuraEnabled
        public List<Case> relatedCaseList;
    }
}