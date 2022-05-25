({
    accounthelper: function(c, e, h) {
        try{
            var Accountobj=c.get("v.Accountobj");
            var action=c.get("c.insertAccount");
            action.setParams(
                {
                    "Accountdetail":Accountobj
                }
            );
            action.setCallback(this,function(response){
                if(response.getState()==="SUCCESS"){
                    var returnvalue=response.getReturnValue();
                    if(returnvalue){
                        c.set('v.toast',true);
                        c.set('v.toastmessage',"Account created successfully");
                        c.set('v.toaststatus',"slds-notify slds-notify_toast slds-theme_success");
                        setInterval(function(){c.set('v.toast',false);},3000); 
                    }
                }
                else{
                    c.set('v.toast',true);
                    c.set('v.toastmessage',"Account is not created");
                    c.set('v.toaststatus',"slds-notify slds-notify_toast slds-theme_warning");
                    setInterval(function(){c.set('v.toast',false);},3000);
                }
            });
            $A.enqueueAction(action);
        }catch(err){
            console.log(err);  
        }
    }
})