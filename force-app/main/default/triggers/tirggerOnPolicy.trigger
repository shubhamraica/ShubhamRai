trigger tirggerOnPolicy on policy__c (before update) {
    if(trigger.Isbefore && trigger.Isupdate){
        //Policy123.policy123Func(trigger.new);
    }
}