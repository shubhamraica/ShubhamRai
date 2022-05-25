({
    handleClick : function(component, event, helper) {
        try{
            helper.helperMethod(component, event, helper);
        }catch(e){
            console.log(e);
        }
    },
    doInit: function(component, event, helper) {
        var d = new Date();
        var curr_date = d.getDate();
        var curr_month = d.getMonth();
        var curr_year = d.getFullYear();
        
        component.set("v.startDate",($A.localizationService.formatDate(new Date(curr_year, curr_month, curr_date-30), "yyyy-MM-dd")));
        component.set("v.endDate",($A.localizationService.formatDate(new Date(curr_year, curr_month, curr_date), "yyyy-MM-dd")));
    },
})