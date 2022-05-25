public class CAYAqn {
    
    @AuraEnabled
    public static sTRING fetchOpptyCloseDate(String recId){
        Opportunity opp = [select Name from Opportunity where id =: recId];
        system.debug('Close Date: ' +opp.NAME);
        
        return opp.nAME;
    }
}