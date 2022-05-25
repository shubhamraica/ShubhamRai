public class Policy123{
    public static void policy123Func(list<policy__c> policyList){
        try {
            List<opportunity> oppList=new List<opportunity>();
            oppList=[select id,policy_number__c	,stagename from opportunity where policy_number__c!=null LIMIT 1000];
            if(oppList.size()>0 && policyList.size()>0){
                for(policy__c policyObj:policyList){
                    for(opportunity oppObj:oppList){
                        if(policyObj.policy_number__c==oppObj.policy_number__c){
                            oppObj.StageName='closed won';                
                            if(policyObj.parent_policy__c!=NULL){
                                policyObj.renew_policy__c=TRUE;
                            }
                            policyObj.Opportunity_name__c=oppObj.Id;
                        }
                    }
                }
            }
            update oppList;
        }catch(Exception e){
            System.debug('Error at line number '+e.getLineNumber()+'. '+e.getMessage());
        }
    }
}