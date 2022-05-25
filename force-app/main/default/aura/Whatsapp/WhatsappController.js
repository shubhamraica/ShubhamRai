({
    HandleClick : function(component, event, helper) {
        // Get the empApi component
        const empApi = component.find('empApi');
        // Get the channel from the input box
        const channel = '/event/WAwebhook__e';
        // Replay option to get new events
        const replayId = -1;

        // Subscribe to an event
        empApi.subscribe(channel, replayId, $A.getCallback(eventReceived => {
            // Process event (this is called each time we receive an event)
            console.log('Received event ', JSON.stringify(eventReceived));
            var data = eventReceived.data.payload;
            console.log(data.chatReceived__c);
            if(data.chatReceived__c){
            helper.GetHandleClickHelper(component,event,helper); 
        }
        }))
        .then(subscription => {
            console.log('subscription : '+subscription);
        });
        helper.HandleClickHelper(component,event,helper);   
    },
    GetHandleClick : function(component, event, helper) {
        helper.GetHandleClickHelper(component,event,helper);   
    }
})