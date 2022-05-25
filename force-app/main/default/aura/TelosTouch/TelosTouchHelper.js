({      
    getObjectList: function(component, ObjectName) {
        var action = component.get('c.getObjectList');
        action.setParams({
            "ObjectName" : ObjectName
        });
        action.setCallback(this, function(actionResult) {
            var resultData = actionResult.getReturnValue();
            component.set('v.ContactList', resultData.contactList);
            component.set('v.LeadList', resultData.leadList);
        });
        $A.enqueueAction(action);
    },
    
    getContactList: function(component, pageNumber, pageSize) {
        var action = component.get("c.getContactData");
        action.setParams({
            "pageNumber" : pageNumber,
            "pageSize"	 : pageSize
        });
        action.setCallback(this, function(result) {
            var state = result.getState();
            if (component.isValid() && state === "SUCCESS"){
                var resultData = result.getReturnValue();
                component.set("v.ContactList", resultData.contactList);
                component.set("v.PageNumber", resultData.pageNumber);
                component.set("v.TotalRecords", resultData.totalRecords);
                component.set("v.RecordStart", resultData.recordStart);
                component.set("v.RecordEnd", resultData.recordEnd);
                component.set("v.TotalPages", Math.ceil(resultData.totalRecords / pageSize));
            }
        });
        $A.enqueueAction(action);
    },
    getLeadList: function(component, pageNumber, pageSize) {
        var action = component.get("c.getLeadData");
        action.setParams({
            "pageNumber" : pageNumber,
            "pageSize"	 : pageSize
        });
        action.setCallback(this, function(result) {
            var state = result.getState();
            if (component.isValid() && state === "SUCCESS"){
                var resultData = result.getReturnValue();
                component.set("v.LeadList", resultData.leadList);
                component.set("v.PageNumber2", resultData.pageNumber);
                component.set("v.TotalRecords2", resultData.totalRecords);
                component.set("v.RecordStart2", resultData.recordStart);
                component.set("v.RecordEnd2", resultData.recordEnd);
                component.set("v.TotalPages2", Math.ceil(resultData.totalRecords / pageSize));
            }
        });
        $A.enqueueAction(action);
    },
})