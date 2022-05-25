public class UpdateOpportunity{
    public Static void UpdateRecords(){
        try{
            List<Opportunity> opportunityList1=new List<Opportunity>();
            List<Opportunity> opportunityList2=new List<Opportunity>();
            opportunityList1=[Select Name From Opportunity Where CloseDate >today];
            for(Opportunity oppObj:opportunityList1){
                oppObj.Name=oppObj.Name+'Update';
                opportunityList2.add(oppObj);
                System.debug(oppObj);
            }
            update opportunityList1;
        }catch (Exception e){
            System.debug('ERROR AT LINE '+e.getLineNumber()+'\n'+' '+e.getMessage());
        }
    }
}