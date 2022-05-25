/*On Product to setup default Pricebook entry in the “Standard Pricebook” as 1$*/
public class setupDefualtPriceBook{
    public static void setupDefualtPriceBookFunc(List<Product2> productList){
        List<PriceBook2> pricebookList =new List<PriceBook2>();
        List<PriceBookEntry> pricebookentrylist = new List<PriceBookEntry>();
        pricebookList=[SELECT id FROM pricebook2 WHERE isstandard=TRUE];
        for(product2 eachProduct:productList){
            PriceBookEntry PB=new PriceBookEntry();
            PB.Pricebook2Id=pricebookList[0].id;
            PB.Product2Id=eachProduct.id;
            PB.UseStandardPrice=false;
            PB.UnitPrice=1;   
            PB.IsActive=TRUE;
            pricebookentrylist.add(PB);
        }       
        if(!pricebookentrylist.isEmpty())
        {
            insert pricebookentrylist;
        }          
    }
}