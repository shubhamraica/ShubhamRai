({
    closeIt : function(component, event, helper){
        document.getElementById('test').style.display = 'none';
        //window.location.href = "https://cloudanalogy268-dev-ed.lightning.force.com/lightning/o/Opportunity/list?filterName=Recent";
    },
    doinit: function(c,e,h) {
        try{
            var action = c.get("c.fetchOpportunity");
            var opportunityid;
            action.setCallback(this,function(response){
                var state = response.getState();
                if(state==="SUCCESS"){
                    c.set("v.Opportunitylist1",response.getReturnValue());
                    console.log(response.getReturnValue());
                    opportunityid=JSON.parse(JSON.stringify(response.getReturnValue()));
                    c.set("v.Oppid",opportunityid.Id);
                    console.log(opportunityid.Id);
                }
                else{
                    console.log("error");
                }
            });
            $A.enqueueAction(action);
        }
        catch(err){
            console.log(err);
        }
    },
    handleClick: function(c,e,h) {
        h.onsave(c,e,h);
    }
})