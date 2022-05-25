({
    helperMethod : function(component, event, helper) {
        var Username = component.get("v.Username");
        var Password = component.get("v.Password");
        var action = component.get("c.getDetails");
        action.setParams({
            Username : Username,
            Password :Password
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                document.getElementById('test').style.display = 'block';
                document.getElementById('test').innerHTML = response.getReturnValue();
                console.log('The return from apex is  :'+JSON.stringify(response.getReturnValue()));
            }
            else{
                alert('SOME ERROR OCCURED');
            }
            console.log('The return from apex is  :'+JSON.stringify(response.getReturnValue()));
        });
        $A.enqueueAction(action);
    }
})