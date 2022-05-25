@isTest
public class DeleteContatcs_Test {
    @testSetup static void Test(){
        Contact conObj = new Contact();
        conObj.LastName = 'testLastName';
        insert conObj;
        Case caseObj = new Case();
        caseObj.Status = 'New';
        caseObj.Origin = 'Web';
        caseObj.ContactId = conObj.id;
        insert caseObj;
    }
    @isTest static void testMethod1(){
        Contact conObj = [SELECT LastName FROM Contact WHERE LastName = 'testLastName' LIMIT 1];
        Case caseObj = [Select CaseNumber from Case Where ContactId =:conObj.Id LIMIT 1]; 
        delete caseObj;
        delete conObj;
        test.startTest();
        deleteContatcs.DeleteRecord();
        test.stopTest();
    }
}