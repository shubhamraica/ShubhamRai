({
    helperMethod : function(c, e, h) {
        try{
            var AccountName = c.get("v.AccountName");
            var NumberOfEmployees = c.get("v.NumberOfEmployees");
            var YearStarted = c.get("v.YearStarted");
            var AnnualRevenue = c.get("v.AnnualRevenue");
            var Industry = c.get("v.Industry");
            console.log("HELPER CALLED, value of AccuontName : "+AccountName);
            var action = c.get("c.CreateNewAccountWithFiveFieldsHandlerFunc");
            action.setParams({
                "AccountName" : AccountName,
                "NumberOfEmployees" : NumberOfEmployees,
                "YearStarted" : YearStarted,
                "AnnualRevenue" : AnnualRevenue,
                "Industry" :Industry                
            });
            action.setCallback(this, function(response){
                var state = response.getState();
                if(state === "SUCCESS"){
                    c.set('v.toast',true);
                    c.set('v.toastmessage',"Account created successfully");
                    c.set('v.toaststatus',"slds-notify slds-notify_toast slds-theme_success");
                    setInterval(function(){c.set('v.toast',false);},3000); 
                    
                    console.log('The return from apex is  :'+JSON.stringify(response.getReturnValue()));
                }
                else{
                    c.set('v.toast',true);
                    c.set('v.toastmessage',"Account is not created");
                    c.set('v.toaststatus',"slds-notify slds-notify_toast slds-theme_warning");
                    setInterval(function(){c.set('v.toast',false);},3000);
                }
            });
            $A.enqueueAction(action);
        }catch(e){
            console.log(e);
        }	
    }
})