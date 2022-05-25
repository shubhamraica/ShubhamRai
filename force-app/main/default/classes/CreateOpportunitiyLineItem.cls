public class CreateOpportunitiyLineItem {
    public static void cloneOpportunity(){
        try{
            Opportunity oppObj=new Opportunity();
            opportunity clone_obj=new opportunity();
            List<OpportunityLineItem> oliList=new List<OpportunityLineItem>();
            oppObj=[select id,Name,closedate from opportunity limit 1];
            if(oppObj!=null){
                oliList=[Select product2id,opportunityid,PricebookEntryId,Unitprice,Quantity from OpportunityLineItem where opportunityid=:oppObj.Id];
            }
            List<OpportunityLineItem> insertproduct=new List<OpportunityLineItem>();
            if(oppObj!=null){
                clone_obj=oppObj.clone(false,false,false,false);
                clone_obj.CloseDate=oppObj.CloseDate.addDays(30);
                clone_obj.Name=oppObj.Name + ' CLONE';
                clone_obj.StageName='closed Won';
                
                insert clone_obj;
            }     
            if(!oliList.isEmpty()){
                for(OpportunityLineItem oliObj1:oliList){
                    OpportunityLineItem oliObj2 =new OpportunityLineItem();
                    OpportunityLineItem oliObj3 =new OpportunityLineItem();
                    
                    oliObj3=oliObj2.clone(false,true,false,false);
                    oliObj3.OpportunityId=clone_obj.Id;
                    oliObj3.Quantity=10;
                    oliObj3.UnitPrice=100;
                    oliObj3.Product2Id=oliObj1.Product2Id;
                    oliObj3.PricebookEntryId=oliObj1.PricebookEntryId;
                    insertproduct.add(oliObj3);
                }
            }
            if(!insertproduct.isEmpty()){
                insert insertproduct;
            }
        }
        catch(Exception e){
            System.debug(e.getMessage());
        }
    }
}