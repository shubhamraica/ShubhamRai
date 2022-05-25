@istest
public class priceBook123_Test {
    @testsetup static void SetUpMethodForScript1()
    {
        //Create Product
        Product2 pro = new Product2(Name = 'iPhone X', Family = 'Mobile');
        Insert pro;
        
        //Instantiate the Pricebook2 record with StandardPricebookId
        Pricebook2 standardPricebook = new Pricebook2(
            Id = Test.getStandardPricebookId(),
            IsActive = true
        );
        
        //Execute an update DML on the Pricebook2 record, to make IsStandard to true
        Update standardPricebook;
        
        //Query for the Pricebook2 record, to check IsStandard field
        standardPricebook = [SELECT Id, IsStandard FROM Pricebook2 WHERE Id = :standardPricebook.Id];
        //It should return true
        System.assertEquals(true, standardPricebook.IsStandard);
        
        
        //Create the PricebookEntry
        PricebookEntry pbe = new PricebookEntry(
            Pricebook2Id = standardPricebook.Id,
            Product2Id = pro.Id,
            UnitPrice = 1020,
            IsActive = true
        );
        Insert pbe;
        
        //Query the PricebookEntry record
        pbe = [SELECT Id, Pricebook2.IsStandard FROM PricebookEntry];
        //It should return true
        System.assertEquals(true, pbe.Pricebook2.IsStandard);
    }
    @istest
    static void ForAccountTesting()
    {
        Pricebook2 price_obj = new Pricebook2();
        price_obj=[Select id, Name from Pricebook2 where IsStandard=true Limit 1];
        test.startTest();
        priceBook123.PriceBookEntry();
        test.stopTest();
    } 
}