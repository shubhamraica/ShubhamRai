/*On Opportunity to alert the user when an Opportunity is being closed with no Opportunity line items in it.*/
public class alertUser {
    public static void alertUserFunc(list<Opportunity> opprList){
        for(Opportunity opprObj : opprList ){
            if(opprObj.hasOpportunityLineItem==false && (opprObj.stagename=='Closed Won' || opprObj.stagename=='Closed Lost')){
                opprObj.addError('You cannot close this opprtunity as it do not have any OLI'); 
            }    
        }
    }
}