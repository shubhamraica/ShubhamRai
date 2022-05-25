trigger triggerOnOpportunity on Opportunity (after insert,before insert, after update, before update){
    if(trigger.isafter && trigger.isinsert){
        //addAllcontacts.addAllcontactsFunc(trigger.new);
    }
    if(trigger.IsAfter &&((trigger.IsUpdate || trigger.IsInsert))){
       // numberOfProductsSold.numberOfProductsSoldFunc(trigger.new);
       //UpdateProduct.updateProductFunc(trigger.new);
    }
    if((Trigger.isInsert || Trigger.isUpdate) && Trigger.isBefore){
      //  validateOpportunity.validateFunc(trigger.new);
    }
    if(trigger.IsBefore && (trigger.IsUpdate || trigger.IsInsert)){
        //alertUser.alertUserFunc(trigger.new);
    }
    if(trigger.IsBefore && trigger.IsInsert){
        //OpportunityTriggerHandler.preventOpp(trigger.new);
    }    
    if((trigger.IsBefore && trigger.IsInsert) || (trigger.IsBefore && trigger.IsUpdate)){
        //OpportunityTriggerHandler.addDiscount(trigger.new);
    }
    if((trigger.IsBefore && trigger.IsInsert)){
        OpportunityTriggerHandler.AccountMethod(trigger.new);
    }
}