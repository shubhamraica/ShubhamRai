@istest
public class CopyAttachment_test {
    @testsetup static void setuptest()
    {
        Account ac=new Account();
        ac.name='testName';
        ac.NumberOfEmployees = 1;
        insert ac;
        contact con=new contact();
        con.AccountId=ac.id;
        con.LastName='testLastName';
        insert con;
        Attachment at=new attachment();
        at.Name='attachment';
        Blob bodyBlob=Blob.valueOf('attachment');
        at.body=bodyBlob;
        at.ParentId=ac.id;
        insert at;
    }
    @istest
    static void CopyAttachment_testmethod()
    {
        contact conn=new contact();
        conn=[select id,lastname,accountid from contact where lastname='testLastName'];
        Attachment attach=new attachment();
        attach=[select id,parentid,body,name from attachment where name='attachment'];
        
        test.startTest();
        AttachmentContact.attachmentRecord();
        test.stopTest();
    }
}