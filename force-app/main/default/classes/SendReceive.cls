public class SendReceive {
    private Static credential__c credentialObj = credential__c.getOrgDefaults();
    private static String AccountSID = credentialObj.AccountSID__c;
    private static string AuthToken = credentialObj.AuthToken__c;
    private static String fromTwilioNumber = credentialObj.fromTwilioNumber__c;
    
    @AuraEnabled public static String sendSMS(){
        try{                      
            String fromwhatsapp;
            HttpRequest RestRequest2 = new HttpRequest();
            RestRequest2.setEndpoint('https://api.twilio.com/2010-04-01/Accounts/AC525a775ce24489b21767dba68f0f345b/Messages.json');
            RestRequest2.setMethod('GET');
            RestRequest2.setHeader('Authorization','Basic '+EncodingUtil.base64Encode(Blob.valueOf(AccountSID+':' +AuthToken)));
            Http http2 = new Http();
            HTTPResponse RestResponse2 = http2.send(RestRequest2); 
            List <String> smsbody = new List <String>();              
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(RestResponse2.getBody());
            List<Object> messages = (List<Object>)(results.get('messages'));
            for(Object eacgMsg : messages){
                Map<String, Object> result = (Map<String, Object>)eacgMsg;
                String body = String.valueOf(result.get('body'));
                smsbody.add(body);   
                System.debug('Body : '+body); 
                String direction = String.valueOf(result.get('direction'));
                smsbody.add(direction);
                System.debug('Direction : '+direction);
                fromwhatsapp = String.valueOf(result.get('from'));
                System.debug('fromwhatsapp : '+fromwhatsapp);
            }
            String MessageBody = '';
            if(smsbody[0] == 'pani'){
                MessageBody = 'kal tak aa jayega.';
            }
            else if(smsbody[0] == 'bijli'){
                MessageBody = 'abhi thoda time lagega light aane mein.';
            }
            else if(smsbody[0] == 'road'){
                MessageBody = 'road toh sahi nahi ho payega abhi.';
            }
            else{
               MessageBody = 'PLease send your problem like : pani or bijli or road'; 
            }
                        
            HttpRequest RestRequest = new HttpRequest();
            RestRequest.setEndpoint('https://api.twilio.com/2010-04-01/Accounts/AC525a775ce24489b21767dba68f0f345b/Messages.json');
            RestRequest.setMethod('POST');
            RestRequest.setHeader('Authorization','Basic '+EncodingUtil.base64Encode(Blob.valueOf(AccountSID+':' +AuthToken)));
            String MobileNumber = fromwhatsapp;
            String fromTwilioNumber = 'whatsapp:+14155238886';
            
            RestRequest.setBody('To='+EncodingUtil.urlEncode(MobileNumber,'UTF-8')+'&From='+EncodingUtil.urlEncode(fromTwilioNumber,'UTF-8')+'&Body='+MessageBody);
            Http http = new Http();
            HTTPResponse RestResponse = http.send(RestRequest);
            
            return NULL;
        }catch(Exception e){
            System.debug('Error at line '+e.getLineNumber()+'. '+e.getMessage());
            return NULL;
        }
    } 
}