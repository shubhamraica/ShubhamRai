public class EmailInfo {
    @AuraEnabled
    public static User getsEmails(){
        try{
            User userInfoObj = [Select Name, Email from User where Id =: userInfo.getUserId() Limit 1];
            System.debug('userInfoList'+userInfoObj);
            return userInfoObj;
        }catch(Exception e){
            System.debug('Error at line '+e.getLineNumber()+'. '+e.getMessage());
        }
        return null;
    }
    @AuraEnabled
    public static fieldWrapper searchDataOnContact(String searchText){
        try{ 
            System.debug('searchText::'+searchText);
            String name ='%' + searchText + '%';
            System.debug('searchText::'+name);
            fieldWrapper fieldSearchObj = new fieldWrapper();
            List<Contact> contactList = [Select Name,Email from Contact where (Name like : name OR Email like :name) And Email!=NULL ];
            List<Lead> leadList = [Select Name,Email from Lead where (Name like : name OR Email like :name) And Email!=NULL ];
            System.debug('contactList::'+contactList);
            System.debug('leadList::' +leadList);
            fieldSearchObj.contactListWrapper=contactList;
            fieldSearchObj.leadListWrapper =leadList;
            system.debug('fieldSearchObj'+fieldSearchObj);
            return fieldSearchObj;
        }catch(Exception e){
            System.debug('Error at line '+e.getLineNumber()+'. '+e.getMessage());
        }
        return null;
    }
    public class fieldWrapper {
        @AuraEnabled public List<Contact> contactListWrapper{get;set;}
        @AuraEnabled public List<Lead> leadListWrapper{get;set;}
    }
    @AuraEnabled
    public static List<ContentDocument> attachementFile(String currentRecordId, String sObjectNamedata){
        try{
            System.debug('recordId::'+currentRecordId);
            System.debug('sObjectName::'+sObjectNamedata);
            
            List<ContentDocumentLink> ContentDocumentLinkList = new List<ContentDocumentLink>();
            ContentDocumentLinkList = [SELECT ContentDocumentId FROM ContentDocumentLink WHERE LinkedEntityId =:currentRecordId];
            Set<Id> contentDocumentIdSet = new Set<Id>();
            for(ContentDocumentLink contObj : ContentDocumentLinkList){
                contentDocumentIdSet.add(contObj.ContentDocumentId);
            }
            System.debug('ContentDocumentLinkList'+ContentDocumentLinkList);
            List<ContentDocument> documents = [SELECT Id, Title,CreatedDate,ContentSize,FileType,LatestPublishedVersionId,FileExtension FROM ContentDocument where Id In : contentDocumentIdSet];
            return documents;
        }catch(Exception e){
            System.debug('Error at line '+e.getLineNumber()+'. '+e.getMessage());
        }
        return NULL;
    }
    @AuraEnabled
    public static void sendEmailMethod(String bodyVal, String fromEmail, String subjectVal, List<String> toEmailVal, List<String> ccEmailVal, List<string> bccEmailVal,List<String> selectedFileListId){
        try{
            System.debug('sendEmail::::::::');
            System.debug('fromEmail::'+fromEmail);
            System.debug('toEmailList::'+toEmailVal);
            System.debug('ccEmailList::'+ccEmailVal);
            System.debug('bccEmailList::'+bccEmailVal);
            System.debug('subject::'+subjectVal);
            System.debug('bodyValue::::'+bodyVal);
            System.debug('selectedFileListId::'+selectedFileListId);
            List<ContentVersion> contentVersionList=[select Title, VersionData,FileExtension from ContentVersion where ContentDocumentId In : selectedFileListId];
            System.debug('jsonFiles'+contentVersionList);
            List<Messaging.Emailfileattachment> fileAttachments = new List<Messaging.Emailfileattachment>();
            for(ContentVersion contentversionObj : contentVersionList){
                system.debug(contentversionObj.title);
                Messaging.EmailFileAttachment efa = new Messaging.EmailFileAttachment();
                efa.setFileName(contentversionObj.Title+'.'+contentversionObj.FileExtension);
                efa.setBody(contentversionObj.versiondata);
                fileAttachments.add(efa);
            }
            System.debug('fileAttachments'+fileAttachments);
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setToAddresses(toEmailVal);
            mail.setCcAddresses(ccEmailVal);
            mail.setBccAddresses(bccEmailVal) ;
            mail.setReplyTo(fromEmail);
            mail.setSenderDisplayName('Salesforce Support');
            mail.setSubject(subjectVal);
            mail.setFileAttachments(fileAttachments);
            mail.setBccSender(false);
            mail.setUseSignature(true);
            mail.setPlainTextBody('this is personal email');
            mail.setHtmlBody(bodyVal);
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
            System.debug('MAIL HAS BEEN SENT BY SHUBHAM RAI...');
        }catch(Exception e){
            System.debug('Error at line '+e.getLineNumber()+'. '+e.getMessage());
        }
    }
    @AuraEnabled
    public static List<ContentDocument> searchFileValueFunction(string searchValue , String accountRecId){
        try{
            System.debug('searchValue'+searchValue);
            System.debug('accountRecId'+accountRecId);
            String name ='%' + searchValue + '%';
            List<ContentDocumentLink> ContentDocumentLinkList = new List<ContentDocumentLink>();
            ContentDocumentLinkList = [SELECT ContentDocument.title,ContentDocumentId FROM ContentDocumentLink WHERE LinkedEntityId =:accountRecId];
            Set<Id> contentDocumentIdSet = new Set<Id>();
            for(ContentDocumentLink contObj : ContentDocumentLinkList){
                contentDocumentIdSet.add(contObj.ContentDocumentId);
            }
            System.debug('ContentDocumentLinkList'+ContentDocumentLinkList);
            List<ContentDocument> documents = [SELECT Id, Title,CreatedDate,ContentSize,FileType,LatestPublishedVersionId,FileExtension FROM ContentDocument where Id In : contentDocumentIdSet And Title like : name];
            System.debug('documents::'+documents);
            return documents;
        }catch(Exception e){
            System.debug('Erroe at line '+e.getLineNumber()+'. '+e.getMessage());
        }
        return NULL;
    }    
}