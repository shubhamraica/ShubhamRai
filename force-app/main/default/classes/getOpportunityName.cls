public class getOpportunityName {
    public static void getOpportunity(){
        try{
            List<OpportunityContactRole> opprList = new List<OpportunityContactRole>();
            opprList = [SELECT Id,Contact.AccountId, Opportunity.AccountId,opportunity.Name 
                        FROM OpportunityContactRole
                        WHERE Opportunity.StageName = 'closed won' LIMIT 10];
            for(OpportunityContactRole oppr : opprList){
                if(oppr.Contact.AccountId == oppr.Opportunity.AccountId){
                    System.debug(oppr.Opportunity.name);
                }
            }
        }catch(Exception e){
            System.debug('Error at line number '+e.getLineNumber()+'. '+e.getMessage());
        }
    }
}