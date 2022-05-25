({    
     HandleClick : function(component, event, helper) {
        helper.HandleClickHelper(component,event,helper);  
         
    },
        
    showDetail: function(component, event, helper) {
    var arr = [];
    arr = component.find("main").getElement().childNodes;
    console.log(event.target);
    for(var cmp in component.find("main").getElement().childNodes) {
        $A.util.removeClass(arr[cmp], "selectedRow");
    }
    var targetElement = event.target;
    $A.util.addClass(targetElement,"selectedRow");
    }
})