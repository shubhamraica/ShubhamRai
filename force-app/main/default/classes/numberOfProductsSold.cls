public class numberOfProductsSold {
    public static void numberOfProductsSoldFunc(List<Opportunity> OpprList){
        try{
            OpprList = [select id, stagename from Opportunity where Stagename LIKE '%Closed Won%'];
            set<id> opp_id = new set<id>();
            for(Opportunity opp_obj :OpprList){
                opp_id.add(opp_obj.Id);
            }
            List<OpportunityLineItem> OpportunityLineItem_List = new List<OpportunityLineItem>();
            OpportunityLineItem_List = [Select id, Product2Id, OpportunityID from OpportunityLineItem where  OpportunityId in:opp_id];
            set<id> product_id = new set<id>();
            for(OpportunityLineItem opplineitem_obj : OpportunityLineItem_List){
                product_id.add(opplineitem_obj.Product2Id);
            }
            Product2 Pro_obj = new Product2();
            Pro_obj = [select id from Product2 where id in: product_id];
            Pro_obj.number_of_products_sold__c =  Pro_obj.number_of_products_sold__c+1;
        }catch (Exception e){
            System.debug('ERROR AT LINE '+e.getLineNumber()+'.'+e.getMessage());
        }
    }
}