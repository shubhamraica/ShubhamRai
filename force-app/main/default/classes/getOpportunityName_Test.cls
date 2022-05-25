@isTest
private Class getOpportunityName_Test{
    @testSetup static void Test(){
        Account accObj= new Account();
        accObj.Name='testName';
        accObj.NumberOfEmployees = 1;
        insert accObj;
        Opportunity opp_obj = new Opportunity();
        opp_obj.Name='OppName';
        opp_obj.StageName='Closed Won';
        opp_obj.CloseDate=date.today().adddays(1);
        opp_obj.AccountId=accObj.Id;
        insert opp_obj;
        Contact Con_obj = new Contact();
        Con_obj.LastName='Test';
        Con_obj.AccountId=accObj.Id;
        insert Con_obj;
        OpportunityContactRole OCR = new OpportunityContactRole();
        OCR.OpportunityId=opp_obj.Id;
        OCR.ContactId=Con_obj.Id;
        OCR.role='abc';
        insert OCR;
    }
    @isTest private static void Opportunity_test_OCR(){
        OpportunityContactRole ocr= new OpportunityContactRole();
        ocr=[Select OpportunityId, ContactId from OpportunityContactRole where role='abc'];
        System.debug('ocr'+ocr);
        test.startTest();
        getOpportunityName.getOpportunity();
        test.stopTest();
    }
}