/*On Opportunity do not let the user insert Opportunities with past closed Date with following Message "Please enter a future Closed Date"*/
public class validateOpportunity{
    public static void validateFunc(List<Opportunity> opprList){
        try{
            if(opprList.size()>0){
                for(Opportunity oppr:opprList){
                    if(oppr.closeDate < date.today()){
                        oppr.addError('Please enter future closed date.');
                    }
                }
            }  
        }catch(Exception e){
            System.debug('Error at line '+e.getLineNumber()+' .'+e.getMessage());
        }
    }    
}