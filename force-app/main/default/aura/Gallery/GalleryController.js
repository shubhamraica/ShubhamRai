({
    doInit1 : function(cmp){
        var action = cmp.get("c.getContents");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if(cmp.isValid() && state === 'SUCCESS') {
                cmp.set("v.contents", response.getReturnValue());
                console.log('return value from apex');
                console.log(v.contents);
            }
        });
        $A.enqueueAction(action);
    },
    
    onAttachfile: function(component, event, helper){
        component.set('v.onShowAttach',true);       
    },
    
    onCancelAttachBtn : function(component, event, helper) {
        component.set('v.onShowAttach',false);
    },
    
    onAddFile : function(component, event, helper) {
        component.set('v.onShowAttach',false);
    },
    
    change: function (c, e, h) {
        var select =(e.currentTarget.dataset.id );
        c.set("v.displayImg",select);
    },
})