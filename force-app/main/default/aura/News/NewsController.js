({
    HandleClick : function(component, event, helper) {
        helper.HandleClickHelper(component,event,helper);  
    },
    selectCountry : function(component, event, helper) {
        var country = event.getSource().get("v.label");
        component.set("v.country",country);
        helper.HandleClickHelper(component,event,helper); 
    },
    selectCategory : function(component, event, helper) {
        var category = event.getSource().get("v.label");
        component.set("v.category",category);
        helper.HandleClickHelper(component,event,helper); 
    }
})