({
    handleClick : function(c, e, h) {
        try{
            var AccountName = c.get("v.AccountName");
            var NumberOfEmployees = c.get("v.NumberOfEmployees");
            var YearStarted = c.get("v.YearStarted");
            var AnnualRevenue = c.get("v.AnnualRevenue");
            var Industry = c.get("v.Industry");
            if(!AccountName){
                c.set('v.toast',true);
                c.set('v.toastmessage',"Name is required...");
                c.set('v.toaststatus',"slds-notify slds-notify_toast slds-theme_warning");
                setInterval(function(){c.set('v.toast',false);},3000); 
            }
            else{
                console.log('you have entered account name');
                h.helperMethod(c, e, h);
            }
            console.log('controller called, value of AccuontName :');
            console.log(c.get("v.AccountName"));
            
        }catch(e){
            console.log(e);
        }
    },  
    handleShowErrorNotice : function(component, event, helper) {
        component.find('notifLib').showNotice({
            "variant": "error",
            "title":"Error",
            "header": "Something has gone wrong!",
            "message": "Unfortunately, there was a problem updating the record.",
            closeCallback: function() {
                alert('You closed the alert!');
            }
        });
    },
})