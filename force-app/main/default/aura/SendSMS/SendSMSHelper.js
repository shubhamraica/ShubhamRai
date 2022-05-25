({
    doinithelper :function(component,event,helper){
        component.set("v.cellphonechat",false);
        component.set("v.otherchat",false);
        component.set("v.Nearestphonechat",false);
        component.set("v.allchat",true);
        component.set("v.variantAll","brand");
        var recordid=component.get("v.recordId");
        console.log('ID OF CURRENT PAGE IS : '+recordid);
        var action = component.get("c.fetchsms");
        action.setParams({
            "recordid" : recordid
        });        
        action.setCallback(this, function(data){
            if(data.getState() == 'SUCCESS'){
                var response=data.getReturnValue();
                //component.set("v.setbody",response);
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
                document.getElementById("oooALL").innerHTML=data;
            }
            else if (data.getState() === "ERROR") {
                $A.log("Errors", data.getError());
            }
        });
        $A.enqueueAction(action);  
    },
    
    selectPatientHelper : function(component, event){
        var recordid=component.get("v.recordId");   
        var action = component.get("c.getPatientPhone");
        action.setParams({
            recordid:recordid
        }); 
        action.setCallback(this, function(data){
            if(data.getState() === 'SUCCESS'){
                var response=data.getReturnValue();
                component.set("v.MobileNumber",response.PatientCellPhone__c);
                var MobileNumber = component.get("v.MobileNumber");
                console.log('MobileNumber : '+MobileNumber);
            }
            else if (data.getState() === "ERROR") {
                console.log('THIS IS WHEN getState FAILED.');
            }
        });
        $A.enqueueAction(action);  
    },
    
    selectOtherHelper : function(component, event){
        var recordid=component.get("v.recordId");   
        var action = component.get("c.getOtherPhone");
        action.setParams({
            recordid:recordid
        }); 
        action.setCallback(this, function(data){
            if(data.getState() === 'SUCCESS'){
                var response=data.getReturnValue();
                component.set("v.MobileNumber",response.OtherPhone__c);
                var MobileNumber = component.get("v.MobileNumber");
                console.log('MobileNumber : '+MobileNumber);
            }
            else if (data.getState() === "ERROR") {
                console.log('THIS IS WHEN getState FAILED.');
            }
        });
        $A.enqueueAction(action);  
    },
    
    selectNeareastHelper : function(component, event){
        var recordid=component.get("v.recordId");   
        var action = component.get("c.getNerarestPhone");
        action.setParams({
            recordid:recordid
        }); 
        action.setCallback(this, function(data){
            if(data.getState() === 'SUCCESS'){
                var response=data.getReturnValue();
                component.set("v.MobileNumber",response.NearestRelativeCaregiverPhone__c);
                var MobileNumber = component.get("v.MobileNumber");
                console.log('MobileNumber : '+MobileNumber);
            }
            else if (data.getState() === "ERROR") {
                console.log('THIS IS WHEN getState FAILED.');
            }
        });
        $A.enqueueAction(action);  
    },
    
    SendSMShelperMethod : function(component, event) {
        var recordid=component.get("v.recordId");
        var MobileNumber=component.get("v.MobileNumber");
        var CountryCode=component.get("v.CountryCode");
        var MessageBody=component.get("v.MessageBody");
        console.log('MOBILE NUMBER : '+MobileNumber);
        console.log('COUNTRY CODE : '+CountryCode);
        console.log('THIS IS MESSAGE BODY WHEN CLICKED SEND : '+MessageBody);
        var action = component.get("c.SendSMS");
        action.setParams({'MobileNumber':MobileNumber,
                          'CountryCode':CountryCode,
                          'MessageBody':MessageBody,
                          'recordid':recordid
                         });
        action.setCallback(this, function(data){
            if(data.getState() == 'SUCCESS'){
                var response=data.getReturnValue();
                if(response==true){
                    var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        mode: 'pester',
                        "title": "SMS Sent Successfully",
                        "message": "Message sent",
                        "type": "success"
                    });
                    toastEvent.fire();
                    var body=component.find("body").get("v.value");
                    console.log('body>>'+body);
                    var currentbody=component.get("v.currentbody");
                    console.log('currentbody>>'+currentbody);
                    currentbody.push(body);
                    component.set("v.currentbody",currentbody);
                    
                    var today = $A.localizationService.formatDate(new Date(), "MMM-DD-YYYY");
                    component.set('v.today', today);
                    var today = new Date();
                    var hours = today.getHours();
                    var minutes = today.getMinutes();
                    var ampm = hours >= 12 ? 'PM' : 'AM';
                    hours = hours % 12;
                    hours = hours ? hours : 12;
                    minutes = minutes < 10 ? '0'+minutes : minutes;
                    var todayTime = hours + ':' + minutes + ' ' + ampm;
                    component.set('v.todayTime', todayTime); 
                    
                    component.set('v.MessageBody', '');
                }
                else{
                    var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        mode: 'pester',
                        "title": "Try Again",
                        "message": "Something went wrong",
                        "type": "error"
                    });
                    toastEvent.fire();
                }
            }
        });
        $A.enqueueAction(action); 
    }
})