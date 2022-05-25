({
    HandleClickHelper : function(component,event,helper) {
        var MessageBody = component.get("v.MessageBody");
        var action = component.get("c.sendSMS");
        action.setParams({
            "MessageBody" : MessageBody,
            "toSendWA" : component.get("v.toSendWA")
        }); 
        action.setCallback(this, function(data){
            if(data.getState() == 'SUCCESS'){
                var response = JSON.parse(data.getReturnValue());
                //console.log('response : '+JSON.stringify(response));
                component.set("v.MessageBody","");
                component.set("v.GetMessageBody",response);
            }
            else{
                alert('error');
            }
        });
        $A.enqueueAction(action);  
    },
    GetHandleClickHelper : function(component,event,helper) {
        var action = component.get("c.getSMS");
        action.setCallback(this, function(data){
            if(data.getState() == 'SUCCESS'){
                var response = JSON.parse(data.getReturnValue());
                var body = response;
                console.log(body);
                component.set("v.GetMessageBody",body);
            }
            else{
                aert('error');
            }
        });
        $A.enqueueAction(action);  
    }
})