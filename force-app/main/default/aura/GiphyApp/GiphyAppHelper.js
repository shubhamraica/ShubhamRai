({
    HandleClickHelper : function(component,event,helper) {
        var query = component.get("v.query");
        var action = component.get("c.getGIF");
        action.setParams({
            "query" : query
        }); 
        action.setCallback(this, function(data){
            if(data.getState() == 'SUCCESS'){
                var response=JSON.parse(data.getReturnValue());                
                component.set("v.imgSrc",response[4]);
            }
        });
        $A.enqueueAction(action);  
    }
})