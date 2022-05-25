public class priceBook123 {
     public static void  PriceBookEntry() {
        try{
            List<Pricebook2> pricebookList = new list<Pricebook2>();   
            Pricebook2 priceObj=new Pricebook2();
            priceObj.Name='Algo Pricebook';
            priceObj.IsActive=TRUE;
            pricebookList.add(priceObj);
            insert pricebookList;
            System.debug(pricebookList);
           
            
            List<Product2> prodList2 = new list<Product2>();
            for(integer i=0;i<10;i++){
                Product2 prodObj = new Product2();
                prodObj.Name='LAPTOP '+i;
                prodObj.IsActive=TRUE;
                prodList2.add(prodObj);   
            }
            insert prodList2;
            System.debug(ProdList2);
           
            
            
            List<Pricebookentry> pricebookEntryList1 = new List<Pricebookentry>();
            List<Pricebookentry> pricebookEntryList2 = new List<Pricebookentry>();
            Pricebook2 pricebookList1 = [SELECT Id, Name from Pricebook2 WHERE isStandard=TRUE limit 1];
            for(Product2 pr: prodList2){
                PricebookEntry priceBEntryObj = new PricebookEntry();
                priceBEntryObj.Pricebook2Id=pricebookList1.id;
                priceBEntryObj.UnitPrice=1000;
                priceBEntryObj.UseStandardPrice=false;
                priceBEntryObj.Product2Id=pr.id;
                priceBEntryObj.IsActive=true;
                pricebookEntryList1.add(priceBEntryObj);
            }
            insert pricebookEntryList1;
            system.debug(pricebookEntryList1);
            for(Product2 pr: prodList2){
                PricebookEntry customPrice = new PricebookEntry();
                customPrice.Pricebook2Id=priceObj.id;
                customPrice.UnitPrice=10;
                customPrice.UseStandardPrice=FALSE;
                customPrice.Product2Id=pr.id;
                customPrice.IsActive=true;
                pricebookEntryList2.add(customPrice);
            }
            insert pricebookEntryList2;
            system.debug(pricebookEntryList2);
        }catch(Exception e){
            System.debug('Error at line number '+e.getLineNumber()+'. '+e.getMessage());
        }
    }
}