public class GalleryApex {
    @AuraEnabled
    public static List<ContentDocument> getAttachments(ID recordId){
        try {
            List<ContentDocumentLink> cdls = [SELECT ContentDocumentId FROM ContentDocumentLink WHERE LinkedEntityId = :recordId];
            Set<Id> documentIds = new Set<Id>();
            for (ContentDocumentLink cdl : cdls) {
                documentIds.add(cdl.ContentDocumentId);
            }
            List<ContentDocument> documents = [SELECT Id FROM ContentDocument WHERE Id IN :documentIds]; 
            return documents;
        } catch(Exception ex) {
            System.debug('Exception is-- '+ex.getMessage()+' at line-->'+ex.getLineNumber());
        }
        return null;
    }
    
    @AuraEnabled
    public static List<ContentVersion> getContents() {
        Set<Id> contentIds = new Set<Id>();
        for (ContentDocument cont :[Select Id ,Title from ContentDocument]) {
            contentIds.add(cont.Id);
        }
        return [SELECT Id, Title, Priority__c FROM ContentVersion WHERE ContentDocumentId IN :contentIds ORDER BY Priority__c];
    }  
}