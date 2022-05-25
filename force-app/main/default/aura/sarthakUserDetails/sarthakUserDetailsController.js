({
    doInit : function(component, event, helper) {
        var action = component.get("c.fetchUserDetail");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var res = response.getReturnValue();
                component.set('v.oUser', res);
            }
            else if (state === "INCOMPLETE") {
                // do something
            }
                else if (state === "ERROR") {
                    var errors = response.getError();
                    if (errors) {
                        if (errors[0] && errors[0].message) {
                            console.log("Error message: " +
                                        errors[0].message);
                        }
                    } else {
                        console.log("Unknown error");
                    }
                }
        });
        $A.enqueueAction(action);
    },
    handleClick : function(c, e, h){
        c.set("v.visibileInputBox",false);
        c.set("v.EditOption",true);
        c.set("v.EditOption2",false);
    },
    cancel2 : function(c, e, h){
        //location.reload();
    },
   
    handleClick2 : function(c, e, h){  
        try{
            var useredit = c.get("v.oUser");           
            var action = c.get("c.EditUserInformation");
            action.setParams({
                "useredit":useredit
            });
           
            action.setCallback(this,function(response){
                if(response.getState() === "SUCCESS")
                    var state = response.getState()
                    console.log('response  '+state);
                {
                    var returnvalue=response.getReturnValue();
                   
                    console.log('response  '+JSON.stringify(returnvalue));
                   
                }
            });
           
            $A.enqueueAction(action);
            location.reload();
           
        }
        catch(error)
        {
            console.log('error ' +error );
        }
    },
    doSave: function(component, event, helper) {
        if (component.find("fileId").get("v.files").length > 0) {
            helper.uploadHelper(component, event, helper);
        } else {
            alert('Please Select a Valid File');
        }
    },
     
    handleFilesChange: function(component, event, helper) {
          component.set("v.photoFrame",true);
       
        component.set("v.profilechange2",false);
        var fileInput = component.find("fileId").get("v.files");
        // get the first file using array index[0]  
        var file = fileInput[0];
        var self = this;
        // create a FileReader object
        var objFileReader = new FileReader();
        // set onload function of FileReader object  
        objFileReader.onload = $A.getCallback(function() {
            var fileContents = objFileReader.result;
            var base64 = 'base64,';
            var dataStart = fileContents.indexOf(base64) + base64.length;
            fileContents = fileContents.substring(dataStart);
            component.set("v.picdidplay","data:image/*;base64,"+fileContents);
            // call the uploadProcess method
        });        
        objFileReader.readAsDataURL(file);
    },
    RemoveImg : function(component, event, helper){
          var action = component.get("c.removepic");
        $A.enqueueAction(action);
            location.reload();
    }
       
   
})