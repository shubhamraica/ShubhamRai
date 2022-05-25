@istest
public class Average_Rating_test {
    @testsetup
    static void testsetupmethod()
    {
        Account ac=new Account();
        ac.name='testName';
        ac.NumberOfEmployees = 1;
        insert ac;
        contact con=new contact();
        con.LastName='testLastName';
        con.AccountId=ac.id;
        con.Average_Rating__c=0;
        insert con;
        Maintenance__c main=new Maintenance__c();
        main.Contact__c=con.id;
        main.RatingPickList__c='5';
        main.Name='try';
        insert main;
    }
    @istest
    static void Average_Rating_testmethod()
    {
        contact conn=new contact();
        conn=[select id,Lastname,Average_Rating__c from contact LIMIT 1];
        Maintenance__c Maintenance_object = new Maintenance__c();
        Maintenance_object = [Select id,name,Contact__c,RatingPickList__c from Maintenance__c];
        test.startTest();
        Average_Rating.calculateRating();
        test.stopTest();
    }
}