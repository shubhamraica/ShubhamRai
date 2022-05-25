({
    handleClick : function(c, e, h) {
        var name=c.find("name").get("v.value");
        var typeOfName = typeof name;
        var number1 = typeof 12;
        var number2 = typeof name;
        if(!name|| /^\s*$/.test(name) || (number1 === number2)){
            c.set('v.toast',true);
            c.set('v.toastmessage',"Please enter account name...");
            c.set('v.toaststatus',"slds-notify slds-notify_toast slds-theme_warning");
            setInterval(function(){c.set('v.toast',false);},3000); 
        }
        else{
            h.accounthelper(c, e, h);
        }
    }
    
})