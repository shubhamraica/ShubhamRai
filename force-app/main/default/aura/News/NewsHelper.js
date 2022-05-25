({
    HandleClickHelper : function(component,event,helper) {
        var category = component.get("v.category");
        var country = component.get("v.country");
        var action = component.get("c.getNewsAgain");
        action.setParams({
            "category" : category,
            "country" : country
        }); 
        action.setCallback(this, function(data){
            if(data.getState() == 'SUCCESS'){
                var response=data.getReturnValue();
                console.log('response returned from apex : '+(response));
                component.set("v.title",response);                
            }
        });
        $A.enqueueAction(action);  
    }
})