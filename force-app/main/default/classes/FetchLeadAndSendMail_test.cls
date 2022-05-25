@istest
public class FetchLeadAndSendMail_test {
    @istest
    static void FetchLeadBatch_testmethod()
    {
        lead leadobj=new lead();
        leadobj.Company='testCompany';
        leadobj.LastName='testLastName';
        insert leadobj;
        FetchLeadAndSendMail batchObj=new FetchLeadAndSendMail();
        database.executeBatch(batchObj);
    }
}