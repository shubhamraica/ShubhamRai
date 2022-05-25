({
    doInit : function(component,event,helper){
        helper.doinithelper(component,event,helper);
    },
    
    selectPatient : function(component,event,helper){
        var liked = component.get("v.liked");
        component.set("v.liked",true);
        component.set("v.liked2",false);
        component.set("v.liked3",false);
        var showPatientCheck = component.get("v.showPatientCheck");
        var showOtherCheck = component.get("v.showOtherCheck");
        var showNeareastCheck = component.get("v.showNeareastCheck");
        if(showPatientCheck==true){
            component.set("v.showPatientCheck",false);
            component.set("v.showOtherCheck",true);
            component.set("v.showNeareastCheck",true);
        }
        else{
            component.set("v.showPatientCheck",true);
        }
        helper.selectPatientHelper(component, event);
    },
    
    selectOther : function(component,event,helper){
        var liked2 = component.get("v.liked2");
        component.set("v.liked",false);
        component.set("v.liked2",true);
        component.set("v.liked3",false);
        var showPatientCheck = component.get("v.showPatientCheck");
        var showOtherCheck = component.get("v.showOtherCheck");
        var showNeareastCheck = component.get("v.showNeareastCheck");
        if(showOtherCheck==true){
            component.set("v.showPatientCheck",true);
            component.set("v.showOtherCheck",false);
            component.set("v.showNeareastCheck",true);
        }
        else{
            component.set("v.showOtherCheck",true);
        }
        helper.selectOtherHelper(component, event);
    },
    
    selectNeareast : function(component,event,helper){
        var liked3 = component.get("v.liked3");
        component.set("v.liked",false);
        component.set("v.liked2",false);
        component.set("v.liked3",true);
        var showPatientCheck = component.get("v.showPatientCheck");
        var showOtherCheck = component.get("v.showOtherCheck");
        var showNeareastCheck = component.get("v.showNeareastCheck");
        if(showNeareastCheck==true){
            component.set("v.showPatientCheck",true);
            component.set("v.showOtherCheck",true);
            component.set("v.showNeareastCheck",false);
        }
        else{
            component.set("v.showNeareastCheck",true);
        }
        helper.selectNeareastHelper(component, event);
    },
    
    Allphonechat : function(component,event,helper){
        var variantOther = component.get("v.variantOther");
        var variantPatient = component.get("v.variantPatient");
        var variantNearest = component.get("v.variantNearest");
        var variantAll = component.get("v.variantAll");
        component.set("v.variantOther","neutral");
        component.set("v.variantPatient","neutral");
        component.set("v.variantNearest","neutral");
        component.set("v.variantAll","brand");
        component.set("v.allchat",false);
        component.set("v.otherchat",false);
        helper.doinithelper(component,event,helper);
    },
    
    otherphonechat:function(component,event,helper){
        var variantOther = component.get("v.variantOther");
        var variantPatient = component.get("v.variantPatient");
        var variantNearest = component.get("v.variantNearest");
        var variantAll = component.get("v.variantAll");
        component.set("v.variantOther","brand");
        component.set("v.variantPatient","neutral");
        component.set("v.variantNearest","neutral");
        component.set("v.variantAll","neutral");
        component.set("v.cellphonechat",false);
        component.set("v.allchat",false);
        component.set("v.otherchat",false);
        component.set("v.Nearestphonechat",false);
        component.set("v.Patientphonechat",false);
        component.set("v.Nearestphonechat",false);
        var recordid=component.get("v.recordId");
        var action = component.get("c.fetchother");
        action.setParams({
            recordid:recordid
        });        
        action.setCallback(this, function(data){
            if(data.getState() == 'SUCCESS'){
                var response=data.getReturnValue();
                //component.set("v.setotherbody",response);
                var data=""; 
                var d;
                for(var i=0; i<response.length; i++){
                    d=new Date(response[i].CreatedDate);
                    if(response[i].Type__c == 'inbound'){
                        data+="<h1 class='slds-float_left leftchat'>"+response[i].Name+"</h1>"+"<br/><br/><h6 class='slds-float_left' style='font-size:10px;color:grey;margin-top:-10px;font-style: italic;'>"
                        +d.getFullYear()+'-'+(d.getMonth()+1)+'-'+d.getFullYear()+','+d.getHours()+':'+d.getMinutes()+"</h6><br/>";
                       
                    }
                    else{																														
                        data+="<h1 class='slds-float_right chat'>"+response[i].Name+"</h1>"+"<br/><br/><h6 class='slds-float_right' style='font-size:10px;color:grey;margin-top:-10px;font-style: italic;'>"
                        +d.getFullYear()+'-'+(d.getMonth()+1)+'-'+d.getFullYear()+','+d.getHours()+':'+d.getMinutes()+"</h6><br/>";
                    }
                }
                document.getElementById("oooOTHER").innerHTML=data;
            }
            else if (data.getState() === "ERROR") {
                $A.log("Errors", data.getError());
            }
        });
        $A.enqueueAction(action);  
        component.set("v.otherchat",true);
    },
    
    Nearestphonechat:function(component,event,helper){
        var variantOther = component.get("v.variantOther");
        var variantPatient = component.get("v.variantPatient");
        var variantNearest = component.get("v.variantNearest");
        var variantAll = component.get("v.variantAll");
        component.set("v.variantOther","neutral");
        component.set("v.variantPatient","neutral");
        component.set("v.variantNearest","brand");
        component.set("v.variantAll","neutral");
        component.set("v.cellphonechat",false);
        component.set("v.allchat",false);
        component.set("v.otherchat",false);
        component.set("v.Nearestphonechat",false);
        component.set("v.Patientphonechat",false);
        var recordid=component.get("v.recordId");
        var action = component.get("c.fetchNearest");
        action.setParams({
            recordid:recordid
        });        
        action.setCallback(this, function(data){
            if(data.getState() == 'SUCCESS'){
                var response=data.getReturnValue();
                component.set("v.setNearestphonebody",response);
            }
            else if (data.getState() === "ERROR") {
                $A.log("Errors", data.getError());
            }
        });
        $A.enqueueAction(action);  
        component.set("v.Nearestphonechat",true);
    },
    
    Patientphonechat:function(component,event,helper){
        var variantOther = component.get("v.variantOther");
        var variantPatient = component.get("v.variantPatient");
        var variantNearest = component.get("v.variantNearest");
        var variantAll = component.get("v.variantAll");
        component.set("v.variantOther","neutral");
        component.set("v.variantPatient","brand");
        component.set("v.variantNearest","neutral");
        component.set("v.variantAll","neutral");
        component.set("v.cellphonechat",false);
        component.set("v.allchat",false);
        component.set("v.otherchat",false);
        component.set("v.Nearestphonechat",false);
        component.set("v.Patientphonechat",false);
        var recordid=component.get("v.recordId");
        var action = component.get("c.fetchPatient");
        action.setParams({
            recordid:recordid
        });        
        action.setCallback(this, function(data){
            if(data.getState() == 'SUCCESS'){
                var response=data.getReturnValue();
                var left = [];
                var right = [];
                for(var i=0; i<response.length; i++){
                    if(response[i].Type__c == 'inbound'){
                        left.push(response[i]);
                        component.set("v.setPatientphonebody",left);
                    }
                    else{
                        right.push(response[i]);
                        component.set("v.setPatientphonebodyRight",right);
                    }                    
                }
            }
            else if (data.getState() === "ERROR") {
                $A.log("Errors", data.getError());
            }
        });
        $A.enqueueAction(action);  
        component.set("v.Patientphonechat",true);
    },
    
    SendingSMScontroller : function(component, event, helper){
        var liked = component.get("v.liked");
        var liked2 = component.get("v.liked2");
        var liked3 = component.get("v.liked3");
        var MobileNumber=component.get("v.MobileNumber");
        var CountryCode=component.get("v.CountryCode");
        var MessageBody=component.get("v.MessageBody");
        if(MessageBody==""){
            var toastEvent = $A.get("e.force:showToast");
            toastEvent.setParams({
                mode: 'pester',
                "title": "The message cannot be blank.",
                "message": "Message not sent",
                "type": "error"
            });
            toastEvent.fire();
        }
        if((liked==false) && (liked2==false) && (liked3==false) ){
            var toastEvent = $A.get("e.force:showToast");
            toastEvent.setParams({
                mode: 'pester',
                "title": "Please select a recipient.",
                "message": "Message not sent",
                "type": "error"
            });
            toastEvent.fire();
        }
        else{
            helper.SendSMShelperMethod(component, event);
        }
    },
})