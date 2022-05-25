public class TestClasstotrrst {
    public static Map<ID, ContentVersion> getRelatedFilesByRecordId(String recordId) {
        system.debug('recordId-->'+recordId);
        // Get record file IDs        
        List<ContentDocumentLink> files = [SELECT ContentDocumentId FROM ContentDocumentLink WHERE LinkedEntityId = :recordId];
        List<ID> fileIDs = new List<ID>();
        for (ContentDocumentLink docLink : files) {
            fileIDs.add(docLink.ContentDocumentId);
        }
        system.debug('fileIDs-->'+fileIDs);
        List<ContentVersion> docs = [SELECT ContentDocumentId, FileExtension, Title, CreatedDate,FileType
                                     FROM ContentVersion WHERE ContentDocumentId IN : fileIDs Order by CreatedDate DESC ];
        Map<ID, ContentVersion> mapIdTitle = new Map<ID, ContentVersion>();
        for (ContentVersion docLink : docs) {
            mapIdTitle.put(docLink.ContentDocumentId, docLink);
        }
        
        return mapIdTitle;
    }
}