({
    selectnamehelper:function(c,e,h){
        try{	
            var selected=e.getParam("value");
            var action=c.get("c.FetchName");
            action.setParams({
                "objName":selected.length>0?selected:"contact"
            });
            action.setCallback(this,function(response){
                if(response.getState()=="SUCCESS")
                {
                    var returnvalue=response.getReturnValue();  
                    c.set("v.Name",returnvalue);
                    c.set("v.allData", returnvalue);
                }  
                
            });
            $A.enqueueAction(action);  
        }
        catch(err)
        {
            console.log(err);
        }
    },
    selectrelatedtohelper:function(c,e,h) {
        try{
            var selected=e.getParam("value");
            var action=c.get("c.Fetchrelatedto");
            action.setParams({
                "obj_Name":selected.length>0?selected:"Account"
            });
            action.setCallback(this,function(response){
                if(response.getState()=="SUCCESS"){
                    var returnvalue=response.getReturnValue();
                    c.set("v.relatedto",returnvalue);
                }
            });
            $A.enqueueAction(action);
        }
        catch(err)
        {
            console.log(err);
        }
    },
    selectAssignedtohelper:function(c,e,h) {
        try{
            var selected=e.getParam("value");
            var action=c.get("c.FetchAssignedto");
            action.setParams({
                "obj_User":selected.length>0?selected:"User"
            });
            action.setCallback(this,function(response){
                if(response.getState()=="SUCCESS")
                {
                    var returnvalue=response.getReturnValue();
                    c.set("v.User",returnvalue);
                }
                
            });
            $A.enqueueAction(action);
        }
        catch(err)
        {
            console.log(err);
        }
    },
    taskHelper: function(c, e, h) {
        try{
            var taskObj=c.get("v.taskObj");
            var action=c.get("c.insertTask");
            action.setParams({
                "TaskDetail":taskObj
            });
            action.setCallback(this,function(response){
                if(response.getState()==="SUCCESS"){
                    var returnvalue=response.getReturnValue();
                    if(returnvalue){
                        var toastEvent = $A.get("e.force:showToast");
                        toastEvent.setParams({
                            "title": "Success!",
                            "type":"success",
                            "message": "Task has been created."
                        });
                        toastEvent.fire();
                        c.set("v.taskObj",{'sobjectType':'Task',
                                           'Subject': '',
                                           'Status': '',
                                           'ActivityDate': '',
                                          });
                    }
                }
                else{
                    var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        "title": "error!",
                        "type": "error",
                        "message": "Some error occured while creating Task."
                    });
                    toastEvent.fire();
                }
            });
            $A.enqueueAction(action);
        }catch(err){
            console.log(err);  
        }
    },
    taskLogHelper: function(c, e, h) {
        try{
            var taskObj=c.get("v.taskLogObj");
            var action=c.get("c.insertLogTask");
            action.setParams({
                "TaskLogDetail":taskObj
            });
            action.setCallback(this,function(response){
                if(response.getState()==="SUCCESS"){
                    var returnvalue=response.getReturnValue();
                    if(returnvalue){
                        var toastEvent = $A.get("e.force:showToast");
                        toastEvent.setParams({
                            "title": "Success!",
                            "type":"success",
                            "message": "Task has been created."
                        });
                        toastEvent.fire();
                    }
                }
                else{
                    var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        "title": "error!",
                        "type": "error",
                        "message": "Some error occured while creating Task."
                    });
                    toastEvent.fire();
                }
            });
            $A.enqueueAction(action);
        }catch(err){
            console.log(err);  
        }
    },
       EventHelper: function(c, e, h) {
        try{
            var eventObj=c.get("v.eventObj");
            var action=c.get("c.insertEvent");
            action.setParams({
                "eventDetail":eventObj
            });
            action.setCallback(this,function(response){
                if(response.getState()==="SUCCESS"){
                    var returnvalue=response.getReturnValue();
                    if(returnvalue){
                        var toastEvent = $A.get("e.force:showToast");
                        toastEvent.setParams({
                            "title": "Success!",
                            "type":"success",
                            "message": "Event has been created."
                        });
                        toastEvent.fire();
                        c.set("v.eventObj",{'sobjectType':'Event',
                                           'Subject': '',
                                           'StartDateTime': '',
                                           'EndDateTime': '',
                                            'IsAllDayEvent':'',
                                            'Location':'',
                                          });
                        $A.get("e.force:refreshView").fire();
                    }
                    else{
                    var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        "title": "error!",
                        "type": "error",
                        "message": "Some error occured while creating Event."
                    });
                    toastEvent.fire();
                }
                }
                
            });
            $A.enqueueAction(action);
        }catch(err){
            console.log(err);  
        }
    }
})