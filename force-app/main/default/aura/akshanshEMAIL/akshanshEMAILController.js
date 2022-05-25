({
    showCc : function(component, event, helper) {
        try
        {
            component.set("v.ccLinkElement",true);
            component.set("v.ccLink",false);
        }
        catch(err)
        {
            console.log(err.message);
        }
    },
    doInit: function(component, event, helper) {
        try
        {
            // Fetch the account list from the Apex controller
            console.log("controller");
            helper.getSObjectList(component);
           
        }
        catch(err)
        {
            console.log(err.message);
        }
        
    },
    handleOptionSelected: function (component, event) {
        try
        {
            var selectedValue = event.getParam("value");
            var emailValue = component.find('fromId').get('v.value');
           // console.log('emailValue'+emailValue);
            
            if(emailValue == 'Email')
            {
                component.set('v.onShowError',false);
                component.set('v.errorMessage','');
            }
            
        }catch(err)
        {
            console.log(err.massage);
        }
    },
    
   
    handleClick : function(component, event, helper)
     {
         try
         {
             component.set("v.condition",0);
             var searchText = document.getElementById('enter-searchTo').value;
             helper.onSearchValue(component,helper,searchText);
             var toValueId = component.find('toDivBorder');
             if(searchText !='')
             {
                 component.set("v.onShowList",true);
                 $A.util.addClass(toValueId, 'showborder');
                 $A.util.removeClass(toValueId, 'toChangeBorder');
                 component.set('v.onShowError',false);
                 component.set('v.errorMessage','');
             }
             else
             {
                 component.set("v.onShowList",false);
             }
             document.addEventListener("keydown", function(event) {
                 console.log(event.which);
                 if(event.which==13)
                 {var input=document.getElementById('enter-searchTo').value;
                  if(component.get("v.condition")<1)
                  {
                      component.set("v.condition",1);
                      var inputto=document.getElementById('enter-searchTo').value;
                      var data={'id':'',
                                'Name':inputto,
                                'Email':inputto};
                      var data2=component.get("v.pillValueList");
                      data2.push(data);
                      component.set("v.pillValueList",data2);
                      document.getElementById('enter-searchTo').value='';
                  }
                 }
             });
         }
         catch(err)
         {
             console.log(err.message);
         }
     },
    convertPill: function(component, event, helper)
    {
        try
        {
            console.log("contactValue:::::");
            var sObjectValue= (event.currentTarget.name).split(",");
            console.log("contactName===>"+sObjectValue[0]);
            console.log("contactObjEmail===>"+sObjectValue[1]);
            console.log("contactObj1=====>"+sObjectValue[2]);
            var getPillsValue ={
                "Name" :sObjectValue[0],
                "Email" :sObjectValue[1],
                "Icon" :sObjectValue[2]
            };
            var email = sObjectValue[1];
            var duplicatevalue = false;
            var pillValue= component.get('v.pillValueList')
            if(pillValue.length == 0){
                pillValue.push(getPillsValue);
                console.log("select value::"+pillValue);
                component.set('v.pillValueList',pillValue);
                console.log('pillValue::::'+JSON.stringify(component.get('v.pillValueList')));
                document.getElementById("enter-searchTo").value = null;
                component.set("v.onShowList",false);
            }
            else{
                for(var i=0; i<pillValue.length ; i++){
                    if(email == pillValue[i].Email){
                        duplicatevalue = true;
                        console.log("duplicatevalue"+duplicatevalue);
                        
                        break;
                    }
                }
                if(duplicatevalue != true){
                    pillValue.push(getPillsValue);
                    component.set('v.pillValueList',pillValue);
                    console.log('pillValue::::'+JSON.stringify(component.get('v.pillValueList')));
                    document.getElementById("enter-searchTo").value = null;
                    component.set("v.onShowList",false);
                    
                }
                else{
                    document.getElementById("enter-searchTo").value = null;
                    component.set("v.onShowList",false);
                    
                }
            }
        }
        catch(err)
        {
            console.log(err.message);
        }
        
    },
    handleRemove: function (component, event) {
        try
        {
            var getPillListValue = event.getSource().get("v.label");
            console.log("current value:"+JSON.stringify(getPillListValue));
            var pillsList = component.get("v.pillValueList");
            console.log("current value:"+JSON.stringify(pillsList.length));
            var i=0;
            for(i=0 ; i < pillsList.length ; i++){
                if(getPillListValue == pillsList[i].Name){
                    
                    pillsList.splice(i, 1);
                }
            }
            component.set("v.pillValueList", pillsList);
            
        }
        catch(err)
        {
            console.log(err.message);
        }
        
        
    },
    handleRemoveCc: function (component, event) {
        try
        {
            var getPillListValue = event.getSource().get("v.label");
            console.log("current value:"+JSON.stringify(getPillListValue));
            var pillsList = component.get("v.pillValueListCc");
            console.log("current value:"+JSON.stringify(pillsList.length));
            var i=0;
            for(i=0 ; i < pillsList.length ; i++){
                if(getPillListValue == pillsList[i].Name){
                    
                    pillsList.splice(i, 1);
                }
            }
            component.set("v.pillValueListCc", pillsList);
            
        }
        catch(err)
        {
            console.log(err.message);
        }
    },
    handleRemoveBcc:function (component, event) {
        try
        {
            var getPillListValue = event.getSource().get("v.label");
            console.log("current value:"+JSON.stringify(getPillListValue));
            var pillsList = component.get("v.pillValueListBcc");
            console.log("current value:"+JSON.stringify(pillsList.length));
            var i=0;
            for(i=0 ; i < pillsList.length ; i++){
                if(getPillListValue == pillsList[i].Name){
                    
                    pillsList.splice(i, 1);
                }
            }
            component.set("v.pillValueListBcc", pillsList);
            
        }
        catch(err)
        {
            console.log(err.message);
        }
        
    },
    handleClickCc : function(component, event, helper){
        try{
            component.set("v.condition",0);
            var toValueId = component.find('toDivBorder');
            var searchTextCc = document.getElementById('enter-searchcc').value;
            helper.onSearchValueCc(component,helper,searchTextCc);
            component.set("v.inputValue",searchTextCc);
            if(searchTextCc !=''){
                component.set("v.onShowListCc",true);
                $A.util.addClass(toValueId, 'showborder');
                $A.util.removeClass(toValueId, 'toChangeBorder');
                component.set('v.onShowError',false);
                component.set('v.errorMessage','');
            }
            else{
                component.set("v.onShowListCc",false);
            }
            document.addEventListener("keydown", function(event) {
                if(event.which==13)
                {var input=document.getElementById('enter-searchcc').value;
                 if(component.get("v.condition")<1)
                 {
                     component.set("v.condition",1);
                     var inputto=document.getElementById('enter-searchcc').value;
                     var data={'id':'','Name':inputto,'Email':inputto};
                     var data2=component.get("v.pillValueListCc");
                     data2.push(data);
                     component.set("v.pillValueListCc",data2);
                     document.getElementById('enter-searchcc').value='';
                 }
                }
            });
        }
        catch(err){
            console.log(err.message);
        }
    },
    convertPillCc : function(component, event, helper)
    {
        try
        {
            console.log("contactValue:::::");
            var sObjectValue= (event.currentTarget.name).split(",");
            console.log("contactName===>"+sObjectValue[0]);
            console.log("contactObjEmail===>"+sObjectValue[1]);
            console.log("contactObj1=====>"+sObjectValue[2]);
            var getPillsValue ={
                "Name" :sObjectValue[0],
                "Email" :sObjectValue[1],
                "Icon" :sObjectValue[2]
            };
            var email = sObjectValue[1];
            var duplicatevalue = false;
            var pillValue= component.get('v.pillValueListCc')
            if(pillValue.length == 0){
                pillValue.push(getPillsValue);
                console.log("select value::"+pillValue);
                component.set('v.pillValueListCc',pillValue);
                console.log('pillValue::::'+JSON.stringify(component.get('v.pillValueListCc')));
                document.getElementById("enter-searchcc").value = null;
                component.set("v.onShowListCc",false);
            }
            else{
                for(var i=0; i<pillValue.length ; i++){
                    if(email == pillValue[i].Email){
                        duplicatevalue = true;
                        console.log("duplicatevalue"+duplicatevalue);
                        
                        break;
                    }
                }
                if(duplicatevalue != true){
                    pillValue.push(getPillsValue);
                    component.set('v.pillValueListCc',pillValue);
                    console.log('pillValue::::'+JSON.stringify(component.get('v.pillValueListCc')));
                   document.getElementById("enter-searchcc").value = null;
                    component.set("v.onShowListCc",false);
                    
                }
                else{
                document.getElementById("enter-searchcc").value = null;
                    component.set("v.onShowListCc",false);
                }
            }
        }
        catch(err)
        {
            console.log(err.message);
        }
    },
    handleClickBcc : function(component, event, helper){
        try{
            component.set("v.condition",0);
            var toValueId = component.find('toDivBorder');
            var searchTextBcc=document.getElementById('enter-searchbcc').value;
            helper.onSearchValueBcc(component,helper,searchTextBcc);
            component.set("v.inputValue",searchTextBcc);
            if(searchTextBcc !=''){
                component.set("v.onShowListBcc",true);
                $A.util.addClass(toValueId, 'showborder');
                $A.util.removeClass(toValueId, 'toChangeBorder');
                component.set('v.onShowError',false);
                component.set('v.errorMessage','');
            }
            else{
                component.set("v.onShowListBcc",false);
            }
            document.addEventListener("keydown", function(event) {
                if(event.which==13)
                {var input=document.getElementById('enter-searchbcc').value;
                 if(component.get("v.condition")<1)
                 {
                     component.set("v.condition",1);
                     var inputto=document.getElementById('enter-searchbcc').value;
                     var data={'id':'','Name':inputto,'Email':inputto};
                     var data2=component.get("v.pillValueListBcc");
                     data2.push(data);
                     component.set("v.pillValueListBcc",data2);
                     document.getElementById('enter-searchbcc').value='';
                 }
                }
            });
        }
        catch(err)
        {
            console.log(err.message);
        }
        
    },
    convertPillBcc: function(component, event, helper)
    {
        try
        {
            console.log("contactValue:::::");
            var sObjectValue= (event.currentTarget.name).split(",");
            console.log("contactName===>"+sObjectValue[0]);
            console.log("contactObjEmail===>"+sObjectValue[1]);
            console.log("contactObj1=====>"+sObjectValue[2]);
            var getPillsValue ={
                "Name" :sObjectValue[0],
                "Email" :sObjectValue[1],
                "Icon" :sObjectValue[2]
            };
            var email = sObjectValue[1];
            var duplicatevalue = false;
            var pillValue= component.get('v.pillValueListBcc')
            if(pillValue.length == 0){
                pillValue.push(getPillsValue);
                console.log("select value::"+pillValue);
                component.set('v.pillValueListBcc',pillValue);
                console.log('pillValue::::'+JSON.stringify(component.get('v.pillValueListBcc')));
                document.getElementById("enter-searchbcc").value = null;
                component.set("v.onShowListBcc",false);
            }
            else{
                for(var i=0; i<pillValue.length ; i++){
                    if(email == pillValue[i].Email){
                        duplicatevalue = true;
                        console.log("duplicatevalue"+duplicatevalue);
                        
                        break;
                    }
                }
                if(duplicatevalue != true){
                    pillValue.push(getPillsValue);
                    console.log("enter duplicate value");
                    component.set('v.pillValueListBcc',pillValue);
                    console.log('pillValue::::'+JSON.stringify(component.get('v.pillValueListBcc')));
                      document.getElementById("enter-searchbcc").value = null;
                    component.set("v.onShowListBcc",false)
                    
                }
                else{
                      document.getElementById("enter-searchbcc").value = null;
                    component.set("v.onShowListBcc",false);
                }
            }
        }
        catch(err)
        {
            console.log(err.message);
        }
    },
    onAttachfile: function(component, event, helper)
    {
        
        component.set('v.onShowAttach',true);
        component.set('v.isSpinner',true);
        window.setTimeout(
            $A.getCallback(function() {
                if(component.isValid()){
                    component.set('v.isSpinner',false);
                }
                else{
                    console.log('Component is Invalid');
                }
            }), 1000
        );
    },
    onCutBtn : function(component, event, helper)
    {
        try
        {
            component.set('v.onShowAttach',false);
            component.set('v.selectedCount',0);
            component.set('v.onVisibleAddbutton',false);
            component.set('v.onInvisibleAddbutton',true);
        }
        catch(err)
        {
            console.log(err.message);
        }
    },
    onCancelAttachBtn : function(component, event, helper)
    {
        try
        {
            component.set('v.onShowAttach',false);
            component.set('v.selectedCount',0);
            component.set('v.onVisibleAddbutton',false);
            component.set('v.onInvisibleAddbutton',true);
        }
        catch(err)
        {
            console.log(err.message);
        }
    },
    doInit1 : function(component, event, helper)
    {
        try
        {
            helper.onAttachfileHelper(component, event, helper);
        }
        catch(err)
        {
            console.log(err.message);
        }
    },
    
    sendMail: function(component, event, helper)
    {
        try
        {
            console.log("tomail");
            var fromIdvalue = component.find('fromId').get('v.value');
            var fromIdvalueData = component.find('fromId');
            var toListValue = component.get("v.pillValueList");
            var cCListValue = component.get("v.pillValueListCc");
            var bCcListValue = component.get("v.pillValueListBcc");
            var subjectValue = component.find('subjectid').get("v.value");
            var bodyValue = component.get('v.bodyval');
            console.log('bodyValue'+bodyValue);
            var bodyValueReplace = '';
            var bodyValueBorder = component.find('bodyid');
            var toValueId = component.find('toDivBorder');
            var subjectValueDataBordr = component.find('subjectid');
            var bodyBorderIdDiv = component.find('bodyBorderId');
            console.log("fromValue::"+fromIdvalue);
            console.log("pillValueList::"+toListValue);
            console.log(toListValue.length);
            
            if(fromIdvalue == 'None')
            {
                component.set('v.onShowError',true);
                component.set('v.errorMessage','Add a current email to send an email.');
                $A.util.addClass(fromIdvalueData, 'slds-has-error');
                return;
            }
            
            
            if(toListValue.length == 0 && cCListValue.length == 0 && bCcListValue.length == 0)
            {
                component.set('v.onShowError',true);
                component.set('v.errorMessage','Fill a recipient to send an email.');
                $A.util.addClass(toValueId, 'toChangeBorder');
                $A.util.removeClass(toValueId, 'showborder');
                return;
            }
            
            console.log('subject'+subjectValue);
            var subjectValueData = subjectValue.trim();
            
            if( $A.util.isEmpty(subjectValueData))
            {
                component.set('v.onShowError',true);
                component.set('v.errorMessage','Fill the subject to send mail.');
                $A.util.addClass(subjectValueDataBordr, 'slds-has-error');
                return;
            }
            console.log('body'+bodyValue);
            bodyValueReplace = bodyValue.replace('<p>', '');
            bodyValueReplace = bodyValueReplace.replace('</p>', '');
            console.log('bodyValueReplace with new whitespace::'+bodyValueReplace);
            bodyValueReplace = bodyValueReplace.replace('<p>', '');
            bodyValueReplace = bodyValueReplace.replace('<br>', '')
            bodyValueReplace = bodyValueReplace.replace('</p>', '');
            console.log('bodyValueReplace with new line::'+bodyValueReplace);
            var bodyValueReplaceAfterTrim = bodyValueReplace.trim();
            if($A.util.isEmpty(bodyValueReplaceAfterTrim))
            {
                component.set('v.onShowError',true);
                component.set('v.errorMessage','Fill the Body to send mail.');
                component.set('v.onBodyBorderColor',true);
                $A.util.addClass(bodyValueBorder, 'slds-has-error');
                return;
            }
            else
            {
                component.set('v.onShowError',false);
            }
            
            helper.sendEmail(component, event, helper, bodyValueReplace);
        }
        catch(err)
        {
            console.log(err.message);
        }
        
    },
    onCheck : function(component, event, helper)
    {
        try
        {
            var checkvalue = event.getSource().get('v.checked');
            var countSelect = component.get('v.selectedCount');
            console.log('countSelect::'+countSelect);
            console.log('checkvalue::'+checkvalue);
            var fileValue = event.getSource().get('v.value');
            console.log('fileValue::'+fileValue);
            var duplicateFile = false;
            
            var fileValueObjsplit = fileValue.split(",");
            console.log('fileValueObjsplit[0]'+fileValueObjsplit[0]);
            console.log('fileValueObjsplit[1]'+fileValueObjsplit[1]);
            console.log('fileValueObjsplit[2]'+fileValueObjsplit[2]);
            try
            {
                var fileValueObj ={ }
                fileValueObj.Title = fileValueObjsplit[0];
                fileValueObj.FileType = fileValueObjsplit[1];
                fileValueObj.Id = fileValueObjsplit[2];
                if(fileValueObj.FileType == 'JPG' || fileValueObj.FileType == 'PNG'){
                    
                    fileValueObj.fileIcon ='doctype:image';
                }
                if(fileValueObj.FileType == 'PDF'){
                    
                    fileValueObj.fileIcon ='doctype:pdf';
                }
                if(fileValueObj.FileType == 'CSV'){
                    
                    fileValueObj.fileIcon ='doctype:csv';
                }
                
                console.log('fileValueObj::'+JSON.stringify(fileValueObj));
                var selectfileList = component.get('v.selectListinAdd');
                
            }catch(err)
            {
                console.log(err.message);
            }
            if(checkvalue == true)
            {
                countSelect++;
                console.log('countSelect::'+countSelect);
                
                selectfileList.push(fileValueObj);
                component.set('v.selectListinAdd',selectfileList);
                
                
                
            }
            else
            {
                countSelect--;
                console.log('countSelect::'+countSelect);
                selectfileList.pop(fileValueObj);
                component.set('v.selectListinAdd',selectfileList);
            }
            component.set('v.selectedCount',countSelect);
            console.log('countSelect::'+countSelect);
            
            var counter = component.get('v.selectedCount');
            if(counter > 0){
                component.set('v.onVisibleAddbutton',true);
                component.set('v.onInvisibleAddbutton',false);
            }
            else{
                component.set('v.onVisibleAddbutton',false);
                component.set('v.onInvisibleAddbutton',true);
            }
        }
        catch(err){
            console.log(err.message);
        }
    },
    onAddFile : function(component, event, helper)
    {
        
        var selectfileList = component.get('v.selectListinAdd');
        if(selectfileList.length > 0)
        {
            component.set('v.selectedFileList',selectfileList)
            component.set("v.onselctedFile",true);
        }
        
        else
        {
            component.set("v.onselctedFile",false);
        }
        
        component.set("v.onShowAttach",false);
        component.set('v.selectedCount',0);
        component.set('v.onInvisibleAddbutton',true);
        component.set('v.onVisibleAddbutton',false);
        
    },
    closeAttachment : function(component, event, helper)
    {
        try
        {
            var getSelectFile = event.getSource().get("v.label");
            console.log("current value:"+JSON.stringify(getSelectFile));
            var getSelectedList = component.get("v.selectedFileList");
            console.log("current value:"+JSON.stringify(getSelectedList.length));
            var i=0;
            for(i=0 ; i < getSelectedList.length ; i++){
                if(getSelectFile == getSelectedList[i].Title){
                    getSelectedList.splice(i, 1);
                }
            }
            component.set("v.selectedFileList", getSelectedList);
        }
        catch(err)
        {
            console.log(err.message);
        }
    },
    onCloseToList : function(component)
    {
        
        component.set("v.onShowList",false);
        
    },
    onCloseccList : function(component, event, helper)
    {
        
        component.set("v.onShowListCc",false);
    },
    onClosebccList : function(component, event, helper)
    {
        component.set("v.onShowListBcc",false);
    },
    handleUploadFinished : function(component, event, helper)
    {
        
        try{
            console.log("File Uploading....::");
            var uploadFileValue =event.getParam("files");
            for(let i=0;i<uploadFileValue.length;i++){
                var documentId = uploadFileValue[i].documentId;
                var name = (uploadFileValue[i].name.split("."))[0];
                var filetype =(uploadFileValue[i].name.split("."))[1];
            }
            var selectedFileListValue = component.get("v.selectedFileList");
            var fileValueObj ={};
            fileValueObj.Title = name;
            fileValueObj.FileType = filetype;
            fileValueObj.Id = documentId;
            if(fileValueObj.FileType == 'jpg'){
                console.log("jpg file");
                fileValueObj.fileIcon ='doctype:image';
            }
            if(fileValueObj.FileType == 'png'){
                console.log("png file");
                fileValueObj.fileIcon ='doctype:image';
            }
            
            
            
            if(fileValueObj.FileType =='csv'){
                fileValueObj.fileIcon ='doctype:csv';
            }
            
            if(fileValueObj.FileType =='pdf'){
                fileValueObj.fileIcon ='doctype:pdf';
            }
            
            
            console.log("selected file value::"+JSON.stringify(fileValueObj));
            selectedFileListValue.push(fileValueObj);
            component.set("v.onShowAttach", false);
            component.set("v.selectedFileList", selectedFileListValue);
            component.set("v.onselctedFile", true);
            console.log("selectedFileListValue::"+JSON.stringify(selectedFileListValue));
        }catch(err){
            console.log(err.message);
        }
    },
    onSearchFile : function(component, event, helper)
    {
        
        var searchFileValue = component.find('enter-search').get('v.value');
        console.log('searchValue::'+searchFileValue);
        console.log('e.which::'+event.which)
        if(event.which === 13)
        {
            helper.onSearchFileHelper(component, helper, searchFileValue);
        }
        
    },
    onPriviewFile : function(component, event, helper)
    {
        try{
            var selectedPillId = event.getSource().get("v.name");
            console.log("selectedPillId::"+selectedPillId);
            $A.get('event.lightning:openFiles').fire({
                recordIds: [selectedPillId]
            });
        }catch(err){
            console.log(err.message);
        }
    },
    onInputRichText : function(component, event, helper)
    {
        var inputValue = component.get("v.bodyval");
        console.log('inputValue::'+inputValue);
        if(inputValue != "")
        {
            component.set('v.onShowError',false);
            component.set('v.errorMessage','');
            component.set('v.onBodyBorderColor',false);
            
        }
        
    },
    onSubjectHandles : function(component, event, helper)
    {
        var subjectValue = component.find('subjectid').get("v.value");
        console.log('subjectValue'+subjectValue);
        if(subjectValue != '')
        {
            component.set('v.onShowError',false);
            component.set('v.errorMessage','');
        }
        
    }
})