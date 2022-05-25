public with sharing class EmailClass {

    @AuraEnabled
    public static List<SObject> search(String searchString) {
        List<SObject> searchList = new List<SObject>();
        try {
            String searchStr = '*' + searchString + '*';
            String searchquery =
                'FIND\'' +
                searchStr +
                '\'IN ALL FIELDS RETURNING Contact(id, name, email where email != null), User(id, name, email where email != null AND isActive = true) LIMIT 10';
            List<List<SObject>> searchResult = search.query(searchquery);
            for (List<SObject> curList : searchResult) {
                searchList.addAll(curList);
            }
            system.debug('searchList:::' + searchList.size());
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        return searchList;
    }


    @AuraEnabled
    public static void sendEmailController(String emailDetailStr) {
        EmailWrapper emailDetails = (EmailWrapper) JSON.deserialize(emailDetailStr, EmailWrapper.class);
        Messaging.reserveSingleEmailCapacity(1);
        try {
            messaging.SingleEmailMessage mail = new messaging.SingleEmailMessage();
            mail.setToAddresses(emailDetails.toAddress);
            mail.setCcAddresses(emailDetails.ccAddress);
            mail.setReplyTo('shubham.rai@cloudanalogy.com');
            mail.setSenderDisplayName('Shubham Rai');
            mail.setSubject(emailDetails.subject);
            mail.setHtmlBody(emailDetails.body);
            mail.setEntityAttachments(emailDetails.files);
            Messaging.sendEmail(new List<messaging.SingleEmailMessage>{ mail });
        } catch (exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    Class EmailWrapper {
        public List<String> toAddress;
        public List<String> ccAddress;
        public String subject;
        public String body;
        public List<String> files;
    }

    @AuraEnabled(Cacheable = true)
    public static allRecWrapper searchSOSL(){
        try {
        system.debug('searchSOSL invoked - APEX');
        Map<Schema.SObjectType, List<sObject>> objsVsRecords = new Map<Schema.SObjectType, List<sObject>>();

        String[] types = new String[0];
        for(sObjectType sType: Schema.getGlobalDescribe().values()) {
            if(sType.getDescribe().isCreateable() && sType.getDescribe().isSearchable() && sType.getDescribe().isUpdateable())  {
                types.add(''+sType);
            }
        }

        String stringToFind = 'rai';
        List<List<sObject>> results = search.query('find :stringToFind in all fields returning '+String.join(types,','));
        for(List<sObject> each : results){
            if(each.size() > 0){
                objsVsRecords.put(each.getSObjectType(),each);
            }
        }

        List<String> allObjsList = new List<String>();
        List<String> allRecsList = new List<String>();
        for(Schema.SObjectType each : objsVsRecords.keySet()){
            allObjsList.add(string.valueof(each));
        }        
        
        for(List<sObject> each : objsVsRecords.values()){
            for(sObject each2 :each){
                system.debug(each2);
                string puriValue = string.valueof(each2);
                String sirfId = puriValue.SubStringAfter('=');
                sirfId = sirfId.SubStringBefore('}');                
                allRecsList.add(sirfId);
            }
        }

        allRecWrapper obj = new allRecWrapper();
        obj.allObjects = allObjsList;
        obj.allRecords = allRecsList;

        return obj;
        } catch (Exception e) {
            system.debug(e.getMessage()+' in searchSOSL() AT LINE NO '+e.getLineNumber());
            return NULL;
        }
    }
    public Class allRecWrapper {
        @AuraEnabled public List<String> allObjects;
        @AuraEnabled public List<String> allRecords;
    }
}