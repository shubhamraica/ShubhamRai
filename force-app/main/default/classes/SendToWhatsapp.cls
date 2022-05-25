public class SendToWhatsapp {
    private Static credential__c credentialObj = credential__c.getOrgDefaults();
    private static String AccountSID = credentialObj.AccountSID__c;
    private static string AuthToken = credentialObj.AuthToken__c;
    private static String fromTwilioNumber = credentialObj.fromTwilioNumber__c;
    
    @AuraEnabled public static String sendSMS(String MessageBody, String toSendWA){
        try{
            List<WAWrapper> directionWrapperList = new List<WAWrapper>();
            HttpRequest RestRequest = new HttpRequest();
            RestRequest.setEndpoint('https://api.twilio.com/2010-04-01/Accounts/AC525a775ce24489b21767dba68f0f345b/Messages.json');
            RestRequest.setMethod('POST');
            RestRequest.setHeader('Authorization','Basic '+EncodingUtil.base64Encode(Blob.valueOf(AccountSID+':' +AuthToken)));
            String MobileNumber = toSendWA;
            String fromTwilioNumber = 'whatsapp:+14155238886';
            RestRequest.setBody('To='+EncodingUtil.urlEncode(MobileNumber,'UTF-8')+'&From='+EncodingUtil.urlEncode(fromTwilioNumber,'UTF-8')+'&Body='+MessageBody);
            Http http = new Http();
            HTTPResponse RestResponse = http.send(RestRequest); 
            
            HttpRequest RestRequest2 = new HttpRequest();
            RestRequest2.setEndpoint('https://api.twilio.com/2010-04-01/Accounts/AC525a775ce24489b21767dba68f0f345b/Messages.json');
            RestRequest2.setMethod('GET');
            RestRequest2.setHeader('Authorization','Basic '+EncodingUtil.base64Encode(Blob.valueOf(AccountSID+':' +AuthToken)));
            Http http2 = new Http();
            HTTPResponse RestResponse2 = http2.send(RestRequest2); 
            List <String> smsbody = new List <String>();
            
            if(RestResponse2.getStatusCode()==200){
                Map<String, String> Report = new Map<String, String>();                
                Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(RestResponse2.getBody());
                List<Object> messages = (List<Object>)(results.get('messages'));
                for(Object eacgMsg : messages){
                    WAWrapper directionWrapper = new WAWrapper();
                    Map<String, Object> result = (Map<String, Object>)eacgMsg;
                    String body = String.valueOf(result.get('body'));  
                    System.debug('Body : '+body); 
                    String direction = String.valueOf(result.get('direction'));
                    System.debug('Direction : '+direction);
                    String fromWA = String.valueOf(result.get('from'));
                    System.debug('fromWA : '+fromWA);
                    String toWA = String.valueOf(result.get('to'));
                    System.debug('toWA : '+toWA);
                    String date_sent = String.valueOf(result.get('date_sent'));
                    System.debug('date_sent : '+date_sent);
                    directionWrapper.msgBody = body;
                    directionWrapper.direction = direction;
                    directionWrapper.fromWA = fromWA;
                    directionWrapper.toWA = toWA;
                    directionWrapper.date_sent = date_sent;
                    directionWrapperList.add(directionWrapper);
                }
                return JSON.serialize(directionWrapperList);
            }else{
                return NULL;
            }
        }catch(Exception e){
            System.debug('Error at line '+e.getLineNumber()+'. '+e.getMessage());
            return NULL;
        }
    } 
    @AuraEnabled public static String getSMS(){
        try{
            List<WAWrapper> directionWrapperList = new List<WAWrapper>();
            HttpRequest RestRequest = new HttpRequest();
            RestRequest.setEndpoint('https://api.twilio.com/2010-04-01/Accounts/AC525a775ce24489b21767dba68f0f345b/Messages.json');
            RestRequest.setMethod('GET');
            RestRequest.setHeader('Authorization','Basic '+EncodingUtil.base64Encode(Blob.valueOf(AccountSID+':' +AuthToken)));
            Http http = new Http();
            HTTPResponse RestResponse = http.send(RestRequest); 
            //System.debug('value of status code : '+ RestResponse);
            List <String> smsbody = new List <String>();
            if(RestResponse.getStatusCode()==200){               
                Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(RestResponse.getBody());
                List<Object> messages = (List<Object>)(results.get('messages'));
                for(Object eacgMsg : messages){
                    WAWrapper directionWrapper = new WAWrapper();
                    Map<String, Object> result = (Map<String, Object>)eacgMsg;
                    String body = String.valueOf(result.get('body'));  
                    System.debug('Body : '+body); 
                    String direction = String.valueOf(result.get('direction'));
                    System.debug('Direction : '+direction);
                    String fromWA = String.valueOf(result.get('from'));
                    System.debug('fromWA : '+fromWA);
                    String toWA = String.valueOf(result.get('to'));
                    System.debug('toWA : '+toWA);
                    String date_sent = String.valueOf(result.get('date_sent'));
                    System.debug('date_sent : '+date_sent);
                    directionWrapper.msgBody = body;
                    directionWrapper.direction = direction;
                    directionWrapper.fromWA = fromWA;
                    directionWrapper.toWA = toWA;
                    directionWrapper.date_sent = date_sent;
                    directionWrapperList.add(directionWrapper);
                }
                return JSON.serialize(directionWrapperList);
            }else{
                return NULL;
            }
        }catch(Exception e){
            System.debug('Error at line '+e.getLineNumber()+'. '+e.getMessage());
            return NULL;
        }
    } 
    public class WAWrapper{
        @AuraEnabled 
        public String msgBody;
        @AuraEnabled  
        public String direction;
        @AuraEnabled  
        public String fromWA;
        @AuraEnabled  
        public String toWA;        
        @AuraEnabled  
        public String date_sent;
    }
}