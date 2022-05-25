({
    // Load expenses from Salesforce
    objectFetch: function(c, e, h) {
        // Create the action
        var action = c.get("c.getAllObjects");
        // Add callback behavior for when response is received
        
        action.setCallback(this, function(response) {
            var state = response.getState();
            console.log(response.getReturnValue());
            if (state == "SUCCESS") {
            c.set("v.objOption",response.getReturnValue());
            }  
              
        });
        // Send action off to be executed
        $A.enqueueAction(action);
    },
    fieldsFetch: function(c, e, h) { 
    var action = c.get("c.getAllFields");    
      var objName=c.get("v.selectedSobject")
        action.setParams({
            "fld": objName
        });
          // Add callback behavior for when response is received
        
        action.setCallback(this, function(response) {
            var state = response.getState();
            console.log(response.getReturnValue());
            if (state == "SUCCESS") {
            c.set("v.FieldList",response.getReturnValue());
            }
        });
        // Send action off to be executed
        $A.enqueueAction(action);
    }
})