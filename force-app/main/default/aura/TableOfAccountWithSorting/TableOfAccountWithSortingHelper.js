({
   onLoad: function(component, event, helper) {
      var action = component.get('c.fetchContact');
      action.setParams({
         'isAsc': component.get("v.isAsc")
      });
      action.setCallback(this, function(response) {
         var state = response.getState();
         if (state === "SUCCESS") {
            component.set('v.ListOfContact', response.getReturnValue());
         }
      });
      $A.enqueueAction(action);
   },
   sortHelper: function(component, event, helper) {
      var isAsc = component.get("v.isAsc");
      if (isAsc == true) {
         component.set("v.isAsc", false);
          document.getElementById('orderBy').innerHTML = 'The list is now in DESC Order.';
      } else {
         component.set("v.isAsc", true);
          document.getElementById('orderBy').innerHTML = 'The list is now in ASC Order.';
      }
      this.onLoad(component, event, helper);
   }
})