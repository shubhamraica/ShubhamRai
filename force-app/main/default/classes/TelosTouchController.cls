public class TelosTouchController {
    @AuraEnabled
    public static ObjectWrapper getObjectList(String ObjectName) {  //for tabset button click
        try{
            ObjectWrapper objWrapper = new ObjectWrapper();
            if(ObjectName == 'Contact'){
                objWrapper.contactList = [SELECT Name, Account.Name, Phone, Email, Owner.Name  FROM Contact LIMIT 10];
                return objWrapper; 
            } 
            if(ObjectName == 'Lead'){
                objWrapper.leadList = [SELECT Name, Email, Phone, Company, Owner.Name  FROM Lead LIMIT 10];
                return objWrapper;  
            }else{
                return NULL;
            }
        }catch(Exception e){
            System.debug('Error at line '+e.getLineNumber()+'. '+e.getMessage());
            return NULL;
        }
    }    
    @AuraEnabled
    public static List<Contact> findContactByName(String searchKey) {           // for contact search bar 
        try{
            String name =  + searchKey + '%';
            return [SELECT id, name, Email, LastName FROM Contact WHERE name LIKE :name ORDER BY createdDate ASC LIMIT 10];
        }catch(Exception e){
            System.debug('Error at line '+e.getLineNumber()+'. '+e.getMessage());
            return NULL;
        }
    }
    @AuraEnabled
    public static List<Lead> findLeadByName(String searchKey) {					 // for lead search bar
        try{
            String name =  + searchKey + '%';
            return [SELECT id, name, Email, LastName FROM Lead WHERE name LIKE :name ORDER BY createdDate ASC LIMIT 10];
        }catch(Exception e){
            System.debug('Error at line '+e.getLineNumber()+'. '+e.getMessage());
            return NULL;
        }
    }
    public class ObjectWrapper {
        @AuraEnabled
        public List<Contact> contactList;
        @AuraEnabled
        public List<Lead> leadList;
    }
    @AuraEnabled				// for contact pagination 
    public static ContactDataTableWrapper getContactData(Integer pageNumber, Integer pageSize) {
        Integer offset = (pageNumber - 1) * pageSize;
        Integer totalRecords = [SELECT COUNT() FROM Contact];
        Integer recordEnd = pageSize * pageNumber;
 
        ContactDataTableWrapper objDT =  new ContactDataTableWrapper();  
        objDT.pageSize = pageSize;
        objDT.pageNumber = pageNumber;
        objDT.recordStart = offset + 1;
        objDT.recordEnd = totalRecords >= recordEnd ? recordEnd : totalRecords;
        objDT.totalRecords = totalRecords;
        objDT.contactList = [SELECT Name, Account.Name, Phone, Email, Owner.Name FROM Contact ORDER BY Name LIMIT :pageSize OFFSET :offset];
        return objDT;
    }
    public class ContactDataTableWrapper {
        @AuraEnabled
        public Integer pageSize;
        @AuraEnabled
        public Integer pageNumber;
        @AuraEnabled
        public Integer totalRecords;
        @AuraEnabled
        public Integer recordStart;
        @AuraEnabled
        public Integer recordEnd;
        @AuraEnabled
        public List<Contact> contactList;
    }
    @AuraEnabled								// for contact pagination 
    public static LeadDataTableWrapper getLeadData(Integer pageNumber, Integer pageSize) {
        Integer offset = (pageNumber - 1) * pageSize;
        Integer totalRecords = [SELECT COUNT() FROM Contact];
        Integer recordEnd = pageSize * pageNumber;
 
        LeadDataTableWrapper objDT =  new LeadDataTableWrapper();  
        objDT.pageSize = pageSize;
        objDT.pageNumber = pageNumber;
        objDT.recordStart = offset + 1;
        objDT.recordEnd = totalRecords >= recordEnd ? recordEnd : totalRecords;
        objDT.totalRecords = totalRecords;
        objDT.leadList = [SELECT Name, Email, Phone, Company, Owner.Name  FROM Lead ORDER BY Name LIMIT :pageSize OFFSET :offset];
        return objDT;
    }
    public class LeadDataTableWrapper {
        @AuraEnabled
        public Integer pageSize;
        @AuraEnabled
        public Integer pageNumber;
        @AuraEnabled
        public Integer totalRecords;
        @AuraEnabled
        public Integer recordStart;
        @AuraEnabled
        public Integer recordEnd;
        @AuraEnabled
        public List<Lead> leadList;
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    public static void somemeth(){
        List<Account> accLIst = [SELECT min__c, max__c, (select amount from Opportunities) FROM Account ]; 
        Integer min = 0;
        Integer max = 0;
        Integer i = 0;
        for(i =0; i <accLIst.size(); i++){
            accLIst[i].min__c = min; 
            accLIst[i].max__c = min; 
        }    
        update accLIst;
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}