public class SMSTwilioApexController {
    static String AccountSID = 'AC525a775ce24489b21767dba68f0f345b';
    static string AuthToken = 'c02463dcd25260c49de6fe4f4a679d6b';
    static String fromTwilioNumber = '+19283252243';
    /* @Description: To Catch the Twilio API errors. */
    public class TwilioErrorResponseWrapper{
        String Errorcode;
        String Errormessage;
        String moreInfo;
        String statusCode;    
    }
    @AuraEnabled
    public static String SendSMS(String MobileNumber,String CountryCode,String MessageBody){
        HttpRequest RestRequest = new HttpRequest();
        //Set's the Account SID in the Twilio Message JSON
        RestRequest.setEndpoint('https://api.twilio.com/2010-04-01/Accounts/'+AccountSID+'/SMS/Messages.json');
        RestRequest.setMethod('POST');
        //Version's of the Salesforce-Twilio
        String TwilioVersionControll  = '3.2.0';
        RestRequest.setHeader('X-Twilio-Client', 'salesforce-' + TwilioVersionControll);
        RestRequest.setHeader('User-Agent', 'twilio-salesforce/' + TwilioVersionControll);
        RestRequest.setHeader('Accept', 'application/json');
        RestRequest.setHeader('Accept-Charset', 'utf-8');
        //Set Authorization to call the Twilio API with AccountSID and AUTH Token
        RestRequest.setHeader('Authorization','Basic '+EncodingUtil.base64Encode(Blob.valueOf(AccountSID+':' +AuthToken)));
        RestRequest.setBody('To='+EncodingUtil.urlEncode(CountryCode+MobileNumber,'UTF-8')+'&From='+EncodingUtil.urlEncode(fromTwilioNumber,'UTF-8')+'&Body='+MessageBody);
        Http http = new Http();
        HTTPResponse RestResponse = http.send(RestRequest);
        if(RestResponse.getStatusCode()==201){
            return 'We Have Sent Message Successfully To '+CountryCode + '-' + MobileNumber;
        }else{
            TwilioErrorResponseWrapper ErrorWrapper =(TwilioErrorResponseWrapper)json.deserialize(RestResponse.getBody(),TwilioErrorResponseWrapper.class);
            return ErrorWrapper.Errormessage+', For This Number'+CountryCode+ '-' + MobileNumber;
        }
    }
}