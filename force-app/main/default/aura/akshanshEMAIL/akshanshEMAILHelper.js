({
    getSObjectList: function(component) {
        try
        {
            console.log("Helper=====>");
            var action = component.get('c.getsEmails');
            action.setCallback(this, function(response) {
                var state = response.getState();
                console.log("State " + state);
                if (state === "SUCCESS") {
                    var storeResponse = response.getReturnValue();
                    console.log("Email"+storeResponse.Email);
                    component.set('v.FromEmail',storeResponse.Email);
                    console.log('Email'+component.get('v.FromEmail'));
                    var options = [
                        { value: "Email", label: storeResponse.Name+'<'+storeResponse.Email+'>'}
                     
                    ];
                   
                    component.set("v.options", options);
                    console.log('userinfo::'+JSON.stringify(response.getReturnValue()));
                    console.log('userinfo::'+component.get("v.options.Email"));
                    
                    
                    
                } });
            
            $A.enqueueAction(action);
        }
        catch(err)
        {
            console.log(err.message);
        }
    },
    onSearchValue:function(component,helper,searchText)
    {
        try
        {
            console.log('searchText'+searchText);
            var action = component.get('c.searchDataOnContact');
            action.setParams({
                "searchText" :searchText
            });
            action.setCallback(this, function(response){
                var state = response.getState();
                console.log('state :'+state);
                if(state === "SUCCESS" || state ==="DRAFT"){
                    var storedResponse = response.getReturnValue();
                    if((storedResponse.contactListWrapper != '' || storedResponse.leadListWrapper != '') || (storedResponse.contactListWrapper != '' && storedResponse.leadListWrapper != ''))
                    {
                        console.log('contactLead'+storedResponse);
                        console.log('storedResponse-->'+JSON.stringify(storedResponse));
                        component.set("v.contactLead",storedResponse);
                        console.log("contactLead"+JSON.stringify(component.get('v.contactLead')));
                    }
                    else
                    {
                        component.set("v.onShowList",false);
                    }
                }
            });
            $A.enqueueAction(action);
        }catch(err)
        {
            console.log(err.message);
        }
    },
    onSearchValueCc: function(component,helper,searchTextCc)
    {
        try
        {
            console.log('searchTextCc'+searchTextCc);
            var action = component.get('c.searchDataOnContact');
            action.setParams({
                "searchText" :searchTextCc
            });
            action.setCallback(this, function(response){
                var state = response.getState();
                console.log('state :'+state);
                if(state === "SUCCESS" || state ==="DRAFT"){
                    var storedResponse = response.getReturnValue();
                    if((storedResponse.contactListWrapper != '' || storedResponse.leadListWrapper != '') || (storedResponse.contactListWrapper != '' && storedResponse.leadListWrapper != ''))
                    {
                        console.log('contactLead'+storedResponse);
                        console.log('storedResponse-->'+JSON.stringify(storedResponse));
                        component.set("v.contactLead",storedResponse);
                        console.log("contactLead"+JSON.stringify(component.get('v.contactLead')));
                    }else
                    {
                        component.set("v.onShowListCc",false);
                    }
                    
                }
            });
            $A.enqueueAction(action);
        }
        catch(err)
        {
            console.log(err.message);
        }
    },
    onSearchValueBcc: function(component,helper,searchTextBcc)
    {
        try
        {
            console.log('searchTextCc'+searchTextBcc);
            var action = component.get('c.searchDataOnContact');
            action.setParams({
                "searchText" :searchTextBcc
            });
            action.setCallback(this, function(response){
                var state = response.getState();
                console.log('state :'+state);
                if(state === "SUCCESS" || state ==="DRAFT"){
                    var storedResponse = response.getReturnValue();
                    if((storedResponse.contactListWrapper != '' || storedResponse.leadListWrapper != '') || (storedResponse.contactListWrapper != '' && storedResponse.leadListWrapper != ''))
                    {
                        console.log('contactLead'+storedResponse);
                        console.log('storedResponse-->'+JSON.stringify(storedResponse));
                        component.set("v.contactLead",storedResponse);
                        console.log("contactLead"+JSON.stringify(component.get('v.contactLead')));
                    }
                    else
                    {
                        component.set("v.onShowListBcc",false);
                    }
                }
            });
            $A.enqueueAction(action);
        }
        catch(err)
        {
            console.log(err.message);
        }
    },
    
    onAttachfileHelper: function(component, event, helper)
    {
        try
        {
            console.log('recordId'+component.get("v.recordId"));
            console.log('recordName'+component.get("v.sObjectName"));
            var action = component.get('c.attachementFile');
            action.setParams({
                "currentRecordId" :component.get("v.recordId"),
                "sObjectNamedata" :component.get("v.sObjectName")
            });
            action.setCallback(this, function(response){
                var state = response.getState();
                console.log('state :'+state);
                if(state === "SUCCESS" || state ==="DRAFT"){
                    var storedResponse = response.getReturnValue();
                    if(storedResponse!=null)
                    {
                        
                        for(let i=0; i<storedResponse.length; i++){
                            if(storedResponse[i].FileType == 'JPG'){
                                storedResponse[i].fileIcon = 'doctype:image';
                            }
                            
                            if(storedResponse[i].FileType == 'CSV'){
                                storedResponse[i].fileIcon = 'doctype:csv';
                            }
                            
                            
                            if(storedResponse[i].FileType == 'PDF'){
                                storedResponse[i].fileIcon = 'doctype:pdf';
                            }
                            try
                            {
                                let contentsizes = storedResponse[i].ContentSize;
                                var sizeValue = (contentsizes/(1024)).toFixed(2);
                                console.log('sizeValue'+sizeValue);
                                storedResponse[i].ContentSize = sizeValue;
                            }
                            catch(err)
                            {
                                console.log(err.message);
                            }
                        }
                        
                        component.set("v.attachmentDataList",storedResponse);
                        console.log(JSON.stringify(storedResponse));
                        
                    }
                    
                }
            });
            $A.enqueueAction(action);
        }catch(err)
        {
            console.log(err.message);
        }
    },
    
    sendEmail : function(component, event, helper,bodyValueReplace)
    {
        var selectedFileListValue = component.get('v.selectedFileList');
        console.log('selectedFileListValue::'+JSON.stringify(selectedFileListValue));
        var selectedFileIdList = [];
        
        for(let i=0; i<selectedFileListValue.length; i++)
        {
            selectedFileIdList.push(selectedFileListValue[i].Id);
        }
        console.log('selectedFileIdList::'+selectedFileIdList);
        
        var subjectValue = component.find('subjectid').get('v.value');
        console.log('subjectValue'+subjectValue);
        
        var bodyValue = bodyValueReplace;
        console.log("body"+bodyValue);
        
        
        var emailValue = component.get('v.FromEmail');
        console.log('emailValue'+emailValue);
        try
        {
            var toEmailList = component.get('v.pillValueList');
            console.log('toEmailList'+JSON.stringify(toEmailList));
            var toEmailValue=[];
            var i=0;
            if(toEmailList.length > 0){
                for(i=0 ; i<toEmailList.length ; i++ ){
                    console.log('toEmail:::'+toEmailList[i].Email);
                    toEmailValue.push(toEmailList[i].Email);
                }
            }
            console.log('toEmailArray'+toEmailValue);
        }
        catch(err)
        {
            console.log(err.message);
        }
        try
        {
            var ccEmailList = component.get('v.pillValueListCc');
            console.log('ccEmailList'+JSON.stringify(ccEmailList));
            var ccEmailValue = [];
            var j=0;
            if(ccEmailList.length > 0){
                for(j = 0 ; j < ccEmailList.length ; j++ ){
                    console.log('ccEmail:::'+ccEmailList[j].Email);
                    ccEmailValue.push(ccEmailList[j].Email);
                }
            }
            console.log('ccEmailArray'+ccEmailValue);
        }
        catch(err)
        {
            console.log(err.message);
        }
        try
        {
            var bccEmailList = component.get('v.pillValueListBcc');
            console.log('bccEmailList'+JSON.stringify(bccEmailList));
            console.log('bccEmail:::'+bccEmailList[0].Email)
            var bccEmailValue = [];
            var k=0;
            if(bccEmailList.length > 0){
                for(k=0 ; k < bccEmailList.length ; k++ ){
                    console.log('bccEmail:::'+bccEmailList[k].Email);
                    bccEmailValue.push(bccEmailList[k].Email);
                }
            }
            console.log('bccEmailArray'+bccEmailValue);
        }
        catch(err)
        {
            console.log(err.message);
        }
        var action = component.get('c.sendEmailMethod');
        action.setParams({
            "fromEmail" :emailValue,
            "subjectVal" :subjectValue,
            "toEmailVal" :toEmailValue,
            "ccEmailVal" :ccEmailValue,
            "bccEmailVal":bccEmailValue,
            "bodyVal" :bodyValue,
            "selectedFileListId" : selectedFileIdList,
            
            
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            console.log('state :'+state);
            if(state === "SUCCESS" || state ==="DRAFT"){
                var storedResponse = response.getReturnValue();
                
                component.set('v.spinnerAfterSendEmail',true);
                window.setTimeout(
                    $A.getCallback(function() {
                        if(component.isValid()){
                            component.set('v.spinnerAfterSendEmail',false);
                            var toastEvent = $A.get("e.force:showToast");
                            toastEvent.setParams({
                                title: "Success!",
                                message: "Email Sent",
                                type: "success"
                            });
                            toastEvent.fire();
                        }
                        else{
                            console.log('Component is Invalid');
                        }
                    }), 2000
                );
                
            }
            component.set('v.selectedFileList',[]);
            component.set('v.pillValueList',[]);
            component.set('v.pillValueListCc',[]);
            component.set('v.subjectValue','');
            component.set('v.bodyval','');
            
        });
        $A.enqueueAction(action);
    },
    onSearchFileHelper : function(component, helper, searchFileValue)
    {
        try
        {
            var accountRecordId = component.get('v.recordId');
            console.log('accountRecordId',accountRecordId);
            console.log('searchFileValue'+searchFileValue);
            var action = component.get('c.searchFileValueFunction');
            action.setParams({
                "searchValue" : searchFileValue,
                "accountRecId" : accountRecordId,
            });
            action.setCallback(this, function(response) {
                var state = response.getState();
                console.log("State " + state);
                if (state === "SUCCESS") {
                    var storeResponse = response.getReturnValue();
                    console.log('storeResponse::'+JSON.stringify(storeResponse));
                    if(storeResponse!=null)
                    {
                        for(let i=0; i<storeResponse.length; i++){
                            if(storeResponse[i].FileType == 'JPG'){
                                storeResponse[i].fileIcon = 'doctype:image';
                            }
                            
                            if(storeResponse[i].FileType == 'CSV'){
                                storeResponse[i].fileIcon = 'doctype:csv';
                            }
                            
                            
                            if(storeResponse[i].FileType == 'PDF'){
                                storeResponse[i].fileIcon = 'doctype:pdf';
                            }
                            try
                            {
                                let contentsizes = storedResponse[i].ContentSize;
                                var sizeValue = (contentsizes/(1024)).toFixed(2);
                                console.log('sizeValue'+sizeValue);
                                storedResponse[i].ContentSize = sizeValue;
                            }
                            catch(err)
                            {
                                console.log(err.message);
                            }
                            
                        }
                        component.set("v.attachmentDataList",storeResponse);
                        var value2 = component.get('v.attachmentDataList');
                        console.log(JSON.stringify(value2));
                    }else{
                        component.set("v.attachmentDataList",[]);
                        var value1 = component.get('v.attachmentDataList');
                        console.log(JSON.stringify(value1));
                    }
                    
                    
                } });
            
            $A.enqueueAction(action);
            
            
        }
        catch(err)
        {
            console.log(err.message);
        }
    },
    
})