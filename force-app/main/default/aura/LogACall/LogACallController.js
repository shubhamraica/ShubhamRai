({  
    
    isAllDayMethod:  function(c, e, h){				//trueFalsetime1 trueFalsetime2
        var trueFalsetime1 = c.get("v.trueFalsetime1");
        var trueFalsetime2 = c.get("v.trueFalsetime2");
        if(trueFalsetime1 == true){
            c.set("v.trueFalsetime1", false);
            c.set("v.trueFalsetime2", true);
            c.set("v.eventObj.IsAllDayEvent",true);
        }
        else{
            c.set("v.trueFalsetime2", false);
            c.set("v.trueFalsetime1", true);
            c.set("v.eventObj.IsAllDayEvent",true);
        }
    },
    
    onCheck: function(cmp, evt) {
    },
    
    IsallDay : function(c, e, h){
        var checkCmp = c.find("EventIsAllDayEvent");
        var isCheck = checkCmp.get("v.value");
        c.set("v.eventObj.IsAllDayEvent" ,  checkCmp.get("v.value"));
        alert(isCheck);
    },
    subjectMethod : function(c, e, h){
        var trueFalse = c.get("v.trueFalse");
        if(trueFalse == false){
            c.set("v.trueFalse", true);
        }
        else{
            c.set("v.trueFalse", false);
        }
        var allRecords = c.get("v.subjectOptions");
        var searchFilter = document.getElementById("search").value;
        var tempArray =[];
        var i;
        for(i=0; i<allRecords.length; i++){
            if((allRecords[i].value.toUpperCase().indexOf(searchFilter.toUpperCase())!=-1)||
               (allRecords[i].value.toLowerCase().indexOf(searchFilter.toLowerCase())!=-1)){
                tempArray.push(allRecords[i]);
            }
        }
        c.set("v.recordList",tempArray);
    },
    change: function (c, e, h) {
        var select =(e.currentTarget.dataset.id );
        c.set("v.taskLogObj.Subject",select);
        c.set("v.trueFalse", false);
        c.set("v.eventObj.Subject",select);
        c.set("v.trueFalse", false);
    },
    myFunction: function (c,e, h) {
        var allRecords = c.get("v.subjectOptions");
        var searchFilter = document.getElementById("search").value;
        var tempArray =[];
        var i;
        for(i=0; i<allRecords.length; i++){
            if((allRecords[i].value.toUpperCase().indexOf(searchFilter.toUpperCase())!=-1)||
               (allRecords[i].value.toLowerCase().indexOf(searchFilter.toLowerCase())!=-1)){
                tempArray.push(allRecords[i]);
            }
        }
        c.set("v.recordList",tempArray);
    },  
    
    myAction : function(c, e, h) {  
        var today = $A.localizationService.formatDate(new Date(), "YYYY-MM-DD");
        c.set('v.today', today);
        var today = new Date();
        var todayTime = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
        c.set('v.todayTime', todayTime);
        var subjectOptions = [
            { value: "--None--", label: "--None--" },
            { value: "Call", label: "Call" },
            { value: "Email", label: "Email" },
            { value: "Send Letter", label: "Send Letter" },
            { value: "Send Quote", label: "Send Quote" },
            { value: "Other", label: "Other" }];
        c.set("v.subjectOptions", subjectOptions);
        var statusOptions = [
            { value: "--None--", label: "--None--" },
            { value: "Not Started", label: "Not Started" },
            { value: "In Progress", label: "In Progress" },
            { value: "Completed", label: "Completed" },
            { value: "Waiting on someone else", label: "Waiting on someone else" },
            { value: "Deferred", label: "Deferred" }
        ];
        c.set("v.statusOptions", statusOptions);
        h.selectnamehelper(c, e, h); 
        h.selectrelatedtohelper(c, e, h); 
        h.selectAssignedtohelper(c, e, h);
    },
    handleMenuSelect: function(c, e, h) {
        var selectedMenu = e.detail.menuItem.get("v.value");
        switch(selectedMenu) {
            case "contact":
                c.set("v.contacttruefalse", true);
                c.set("v.leadtruefalse", false);
                break;
            case "lead":
                c.set("v.contacttruefalse", false);
                c.set("v.leadtruefalse", true);
                break;
        }
    },
    
    
    showHidePage: function(c, e, h) {
        c.set("v.showHidePage", false);
    },
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    handleClick : function(c, e, h) {
        try{
            var subject = c.find("subject").get("v.value");
            var duedate = c.find("duedate").get("v.value");
            var name = c.find("whoid").get("v.value");
            var relatedTo = c.find("whatid").get("v.value");
            var assignedTo = c.find("ownerid").get("v.value");
            var status = c.find("status").get("v.value");
            console.log(subject);
            console.log(duedate);
            console.log(name); 
            console.log(relatedTo);								//showPageError 	ul class="errorsList" liError genericError   forcePageError
            console.log(assignedTo);
            console.log(status);
            if(!status || (status=='--None--')&& (!assignedTo)){ 
                c.set("v.showPageError", true);
            }
            else if(!status){
                c.set("v.showPageErrorStatus", true);
            }
                else if(!assignedTo){
                    c.set("v.showPageErrorassigned", true);
                }
                    else{       
                        c.set("v.showPageError", false);
                        c.set("v.showPageErrorassigned", false);
                        c.set("v.showPageErrorStatus", false);
                        console.log('calling helper');
                        h.taskHelper(c, e, h);
                    }
        }
        catch(err)
        {
            console.log(err);
        }   
    },
    //var elmnt = document.getElementsByClassName("pageLevelErrors");
    // elmnt.scrollIntoView(300, 500);
    //document.getElementsByClassName("forcePageError").style.color = "105%";
    //document.getElementsByClassName("forcePageError").style.margin= "0px 0px 0px -16px";
    //c.set("v.showPageError", true);
    
    
    
    
    /* var ul = document.getElementsByClassName("errorsList");
                var li = document.createElement("li");
                li.appendChild(document.createTextNode("These required fields must be completed: Assigned To, Status"));
                ul.appendChild(li);
                c.set("v.showPageError", true);
                
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "error!",
                    "type": "error",
                    "message": "Please review errors on the page."
                });
                toastEvent.fire();*/
    handleLogClick : function(c, e, h) {
        alert('calling log helper ');
        h.taskLogHelper(c, e, h);
    },
    
    handleEventClick : function(c, e, h) {
        /*var evenObjtsubject = c.find("eventObjSubject").get("v.value");
        var EventObjStartDateTime = c.find("EventObjStartDateTime").get("v.value");
        var EventObjEndTime = c.find("EventObjEndDateTime").get("v.value");
        var EventObjWhoId = c.find("EventObjWhoId").get("v.value");
        var EventObjWhatId = c.find("EventObjWhatId").get("v.value");
        var EventObjOwnerId = c.find("EventObjOwnerId").get("v.value");
        var EventObjLocation = c.find("EventObjLocation").get("v.value");
        console.log(eventObjsubject);*/
        alert('calling event helper ');
        h.EventHelper(c, e, h);
    },
    
    //on selecting Name
    selectname:function(c,e,h){
        h.selectnamehelper(c,e,h);
    },
    //on selecting related to
    selectrelatedto:function(c,e,h) {
        h.selectrelatedtohelper(c,e,h);
    },
    //on selecting assigned to
    selectAssignedto:function(c,e,h){
        h.selectAssignedtohelper(c,e,h);
    },
    // common reusable function for toggle sections
    toggleSection : function(c, e, h) {
        // dynamically get aura:id name from 'data-auraId' attribute
        var sectionAuraId = e.target.getAttribute("data-auraId");
        // get section Div element using aura:id
        var sectionDiv = c.find(sectionAuraId).getElement();
        /* The search() method searches for 'slds-is-open' class, and returns the position of the match.
         * This method returns -1 if no match is found.
        */
        var sectionState = sectionDiv.getAttribute('class').search('slds-is-open'); 
        
        // -1 if 'slds-is-open' class is missing...then set 'slds-is-open' class else set slds-is-close class to element
        if(sectionState == -1){
            sectionDiv.setAttribute('class' , 'slds-section slds-is-open');
        }else{
            sectionDiv.setAttribute('class' , 'slds-section slds-is-close');
        }
    }
})