public class SMSapex {
      static String AccountSID = 'AC525a775ce24489b21767dba68f0f345b';
    static string AuthToken = 'c02463dcd25260c49de6fe4f4a679d6b';
    static String fromTwilioNumber = '+19283252243';
    @AuraEnabled
    public static boolean SendSMS(String MobileNumber,String CountryCode,String MessageBody,Id recordid){
        HttpRequest RestRequest = new HttpRequest();
        RestRequest.setEndpoint('https://api.twilio.com/2010-04-01/Accounts/'+AccountSID+'/SMS/Messages.json');
        RestRequest.setMethod('POST');
        RestRequest.setHeader('Authorization','Basic '+EncodingUtil.base64Encode(Blob.valueOf(AccountSID+':' +AuthToken)));
        RestRequest.setBody('To='+EncodingUtil.urlEncode(CountryCode+MobileNumber,'UTF-8')+'&From='+EncodingUtil.urlEncode(fromTwilioNumber,'UTF-8')+'&Body='+MessageBody);
        Http http = new Http();
        HTTPResponse RestResponse = http.send(RestRequest); 
        if(RestResponse.getStatusCode()==201){
            SMS__c smsobj = new SMS__c();
            //smsobj.Message__c=MessageBody;
            smsobj.Phonenumber__c=MobileNumber;
            smsobj.Account__c=recordid;
            smsobj.Name=MessageBody;
            insert smsobj;
            return true;
        }else{
            return false;
        }
    }
    @AuraEnabled
    public static list<SMS__c> fetchsms(ID recordid)
    {
        list<SMS__c> smslist=[select name,createddate from SMS__c where Account__c=:recordid];
        system.debug(smslist);
        return smslist;
    }
}