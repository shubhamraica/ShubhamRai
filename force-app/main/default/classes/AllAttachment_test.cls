@istest
public class AllAttachment_test {
@testsetup
static void testsetupmethod()
{
    
}    
    @istest
    static void AllAttachment_testmethod()
    {
       Account ac=new Account();
        ac.name='testName';
        ac.NumberOfEmployees=1;
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
        test.startTest();
        AllAttachment.attachmentRecord(); 
        test.stopTest();
    }
}