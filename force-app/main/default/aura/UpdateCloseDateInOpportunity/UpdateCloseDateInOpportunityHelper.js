({
    onsave: function(c,e,h) {
        try{
            var id=c.get("v.Oppid");
            var closedate = c.find("c-date").get("v.value");
           
                var action = c.get("c.updateOpportunity");
                action.setParams({
                    "closedate":closedate,
                    "opportunityid":id
                });
                window.location.href = "https://cloudanalogy268-dev-ed.lightning.force.com/lightning/o/Opportunity/list?filterName=Recent";
                $A.enqueueAction(action);
               
        }
        catch(err){
            console.log(err);
        }
    }
})