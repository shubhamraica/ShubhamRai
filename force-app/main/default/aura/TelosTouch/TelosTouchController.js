({
    doInit: function(component, event, helper) {
        var ObjectName = 'Contact';
        helper.getObjectList(component, ObjectName);
    },
    
    handleNext: function(component, event, helper) {
        var pageNumber = component.get("v.PageNumber");  
        var pageSize = component.find("pageSize").get("v.value");
        pageNumber++;
        helper.getContactList(component, pageNumber, pageSize);
    },
     
    handlePrev: function(component, event, helper) {
        var pageNumber = component.get("v.PageNumber");  
        var pageSize = component.find("pageSize").get("v.value");
        pageNumber--;
        helper.getContactList(component, pageNumber, pageSize);
    },
     
    onSelectChange: function(component, event, helper) {
        var page = 1
        var pageSize = component.find("pageSize").get("v.value");
        helper.getContactList(component, page, pageSize);
    },
    
    handleNext2: function(component, event, helper) {
        var pageNumber = component.get("v.PageNumber2");  
        var pageSize = component.find("pageSize2").get("v.value");
        pageNumber++;
        helper.getLeadList(component, pageNumber, pageSize);
    },
     
    handlePrev2: function(component, event, helper) {
        var pageNumber = component.get("v.PageNumber2");  
        var pageSize = component.find("pageSize2").get("v.value");
        pageNumber--;
        helper.getLeadList(component, pageNumber, pageSize);
    },
     
    onSelectChange2: function(component, event, helper) {
        var page = 1
        var pageSize = component.find("pageSize2").get("v.value");
        helper.getLeadList(component, page, pageSize);
    },
    
    HandleContactClick : function(component, event, helper) {
        var ObjectName = 'Contact';
        helper.getObjectList(component, ObjectName);
    },
    
    HandleLeadClick : function(component, event, helper) {
        var ObjectName = 'Lead';
        helper.getObjectList(component, ObjectName);
    },
    
    searchContact: function(component, event) {
        var searchKey = component.find("searchContactKey").get("v.value");
        var action = component.get("c.findContactByName");
        action.setParams({
            "searchKey": searchKey
        });
        action.setCallback(this, function(a) {
            component.set("v.ContactList", a.getReturnValue());
        });
        $A.enqueueAction(action);
    },
    
    searchLead: function(component, event) {
        var searchKey = component.find("searchLeadKey").get("v.value");
        var action = component.get("c.findLeadByName");
        action.setParams({
            "searchKey": searchKey
        });
        action.setCallback(this, function(a) {
            component.set("v.LeadList", a.getReturnValue());
        });
        $A.enqueueAction(action);
    },
    
    HandleSelectedContacts: function(component, event, helper) {
        var objectList = component.get("v.ContactList");
        var selectedtLists = component.get("v.selectedClientsList");
        selectedtLists = [...new Set(selectedtLists)];
        for(var i=0; i<objectList.length; i++){
            if(objectList[i].selected  == true){
                selectedtLists.push(objectList[i]);
            }
        }
        let uniqueChars = [...new Set(selectedtLists)];
        component.set("v.selectedClientsList",uniqueChars);
    },
    
    HandleSelectedLeads: function(component, event, helper) {
        var objectList = component.get("v.LeadList");
        var selectedtLists = component.get("v.selectedClientsList");
        selectedtLists = [...new Set(selectedtLists)];
        for(var i=0; i<objectList.length; i++){
            if(objectList[i].selected  == true){
                selectedtLists.push(objectList[i]);
            }
        }
        let uniqueChars = [...new Set(selectedtLists)];
        component.set("v.selectedClientsList",uniqueChars);
    },
    
    RemoveClient: function(component, event, helper) {       
        var index = event.target.dataset.index;     
        var selectedtLists = component.get("v.selectedClientsList");
        selectedtLists.splice(index, 1);
        component.set("v.selectedClientsList",selectedtLists);
    },
    
    HandleSubmitClick: function(component, event, helper) {
        alert('Submit Clicked!');
    }
})