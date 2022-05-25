({
    HandleClickHelper : function(component,event,helper) {
        var action = component.get("c.sendSMS");
        action.setCallback(this, function(data){
            if(data.getState() == 'SUCCESS'){
                
            }
            else{
                aert('error');
            }
        });
        $A.enqueueAction(action);  
    }
})