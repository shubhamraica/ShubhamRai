public class UpdateCloseDateInOpportunityHandler{
    @auraEnabled
    public static Opportunity fetchOpportunity(){
        try{
            list<Opportunity>Opportunitylist=new list<Opportunity>();
            Opportunitylist=[select Id,Name,CloseDate,StageName from Opportunity limit 1];
            Opportunity op=new Opportunity();
            op.Name=Opportunitylist[0].name;
            op.StageName=Opportunitylist[0].stagename;
            op.CloseDate=Opportunitylist[0].CloseDate;
            op.Id=Opportunitylist[0].Id;
            return op;
        }
        catch(Exception e){
            system.debug(e.getLineNumber()+e.getMessage());
        }
        return null;
    }
    @auraEnabled
    public static void updateOpportunity(Date closedate,Id opportunityid){
        try{
            Opportunity oppobj=new Opportunity();
            oppobj.Id=opportunityid;
            oppobj.CloseDate=closedate;
            update oppobj;
        }
        catch(Exception e){
            system.debug(e.getLineNumber()+e.getMessage());
        }
    }
}