({
    showAccount : function(c, e, h) {
        var action = c.get('c.FetchAccountsMethod');
        var self = this;
        action.setCallback(this, function(actionResult) {
            c.set('v.accList', actionResult.getReturnValue());
        });
        $A.enqueueAction(action);
    },
    	createContact : function(c, e, h) {
        var LastName = c.get("v.LastName");
        var conAccountId = c.get("v.conAccountId");
        var action = c.get("c.CreateContactMethod");
        action.setParams({
            "conAccountId": conAccountId,
            "LastName":LastName
        });
        action.setCallback(this,function(response){
            //alert(response.getReturnValue());
            document.getElementById('test').style.display = 'block';
            document.getElementById('test').innerHTML = response.getReturnValue();
        });
            
        $A.enqueueAction(action);
    }
})