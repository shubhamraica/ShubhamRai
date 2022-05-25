trigger triggerOnCampaign on Campaign (after update){
    if(Trigger.isUpdate){
        if(Trigger.isAfter){
           // closeAllOpportunity.closeAllOpportunityFunc(Trigger.New);
        }
    }
}