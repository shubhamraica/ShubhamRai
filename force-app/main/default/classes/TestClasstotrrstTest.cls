@isTest
public class TestClasstotrrstTest {
    @isTest
    private static void getRelatedFilesByRecordIdTest(){
        
        Contact con = new Contact();
        con.Firstname = 'test';
        con.LastName = 'dsd';
        insert con;
        
        ContentVersion cv = new Contentversion();
        cv.title='ABC';
        cv.PathOnClient ='ABC.jpg';
        cv.versiondata=EncodingUtil.base64Decode('Unit Test Attachment Body');
        insert cv;
        ContentVersion testContent = [SELECT id, ContentDocumentId FROM ContentVersion where Id = :cv.Id];	
        
        ContentDocumentLink contentlink = new ContentDocumentLink();
        contentlink.LinkedEntityId = con.id;
        contentlink.ShareType= 'V';
        contentlink.ContentDocumentId = testcontent.ContentDocumentId;
        contentlink.Visibility = 'AllUsers';
        insert contentlink;
        
        Test.startTest();
        TestClasstotrrst.getRelatedFilesByRecordId(con.Id);
        Test.stopTest();
    }
}