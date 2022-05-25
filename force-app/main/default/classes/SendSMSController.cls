public class SendSMSController {
    private Static credential__c credentialObj = credential__c.getOrgDefaults();
    private static String AccountSID = credentialObj.AccountSID__c;
    private static string AuthToken = credentialObj.AuthToken__c;
    private static String fromTwilioNumber = credentialObj.fromTwilioNumber__c;
    @AuraEnabled
    public static boolean SendSMS(String MobileNumber,String CountryCode,String MessageBody,Id recordid){
        System.debug('******************** STARTING OF SendSMSController ********************');
        try{
            HttpRequest RestRequest = new HttpRequest();
            RestRequest.setEndpoint('https://api.twilio.com/2010-04-01/Accounts/'+AccountSID+'/SMS/Messages.json');
            RestRequest.setMethod('POST');
            RestRequest.setHeader('Authorization','Basic '+EncodingUtil.base64Encode(Blob.valueOf(AccountSID+':' +AuthToken)));
            RestRequest.setBody('To='+EncodingUtil.urlEncode(CountryCode+MobileNumber,'UTF-8')+'&From='+EncodingUtil.urlEncode(fromTwilioNumber,'UTF-8')+'&Body='+MessageBody);
            Http http = new Http();
            HTTPResponse RestResponse = http.send(RestRequest); 
            System.debug('value of status code : '+ RestResponse);
            if(RestResponse.getStatusCode()==201 || RestResponse.getStatusCode()==200){
                SMS__c smsobj = new SMS__c();
                smsobj.Phonenumber__c = MobileNumber;
                smsobj.Account__c = recordid;
                smsobj.Name = MessageBody;
                smsobj.UserName__c = UserInfo.getName();    
                smsobj.type__c = 'outbound';
                insert smsobj;
                return true;
            }else{
                return false;
            }
        }catch(Exception e){
            System.debug('Error at line '+e.getLineNumber()+'. '+e.getMessage());
            return NULL;
        }
    }
    @AuraEnabled
    public static list<SMS__c> fetchsms(ID recordid){
        try{
            list<SMS__c> smslist=[select Name, createDdate, Type__c, UserName__c from SMS__c ORDER BY createDdate];
            system.debug('smslist : '+smslist);
            return smslist;
        }catch(Exception e){
            System.debug('Error at line '+e.getLineNumber()+'. '+e.getMessage());
            return NULL;
        }
    }
    @AuraEnabled
    public static list<SMS__c> fetchother(ID recordid){
        try{
            list<account> accobj=[SELECT id, OtherPhone__c from Account WHERE id=:recordid];
            set<string> phone =new set<string>();
            for(Account ac : accobj){
                phone.add(ac.OtherPhone__c);  
            }        
            list<SMS__c> smslist=[select name,createddate, Type__c, UserName__c, Phonenumber__c from SMS__c 
                                  where (Account__c=:recordid AND Phonenumber__c =: phone)  
                                  ORDER BY createddate];
            system.debug('othernophoneno:>>'+smslist);
            return smslist;
        }catch(Exception e){
            System.debug('Error at line '+e.getLineNumber()+'. '+e.getMessage());
            return NULL;
        }
    }
    @AuraEnabled
    public static list<SMS__c> fetchNearest(ID recordid){
        try{
            list<account> accobj=[SELECT id, NearestRelativeCaregiverPhone__c from Account WHERE id=:recordid];
            set<string> phone =new set<string>();
            for(Account ac : accobj){
                phone.add(ac.NearestRelativeCaregiverPhone__c);  
            }        
            list<SMS__c> smslist=[select name,createddate, Type__c, UserName__c, Phonenumber__c from SMS__c 
                                  where (Account__c=:recordid AND Phonenumber__c =: phone)  
                                  ORDER BY createddate];
            system.debug('nearestphoneno:>>'+smslist);
            return smslist;
        }catch(Exception e){
            System.debug('Error at line '+e.getLineNumber()+'. '+e.getMessage());
            return NULL;
        }
    }
    @AuraEnabled
    public static list<SMS__c> fetchPatient(ID recordid){
        try{
            list<account> accobj=[SELECT id, PatientCellPhone__c from Account WHERE id=:recordid];
            set<string> phone =new set<string>();
            for(Account ac : accobj){
                phone.add(ac.PatientCellPhone__c);  
            }        
            list<SMS__c> smslist=[select name,createddate, Type__c, UserName__c, Phonenumber__c from SMS__c 
                                  where (Account__c=:recordid AND Phonenumber__c =: phone)  
                                  ORDER BY createddate];
            system.debug('patientphoneno:>>'+smslist);
            return smslist;
        }catch(Exception e){
            System.debug('Error at line '+e.getLineNumber()+'. '+e.getMessage());
            return NULL;
        }
    }
    @AuraEnabled
    public static Account getPatientPhone(ID recordid){
        try{
            Account NerarestPhone = [SELECT PatientCellPhone__c  FROM Account WHERE id =:recordid];
            system.debug(NerarestPhone);
            return NerarestPhone;
        }catch(Exception e){
            System.debug('Error at line '+e.getLineNumber()+'. '+e.getMessage());
            return NULL;
        }
    }
    @AuraEnabled
    public static Account getOtherPhone(ID recordid){
        try{
            Account NerarestPhone = [SELECT OtherPhone__c FROM Account WHERE id =:recordid];
            system.debug(NerarestPhone);
            return NerarestPhone;
        }catch(Exception e){
            System.debug('Error at line '+e.getLineNumber()+'. '+e.getMessage());
            return NULL;
        }
    } 
    @AuraEnabled
    public static Account getNerarestPhone(ID recordid){
        try{
            Account NerarestPhone = [SELECT NearestRelativeCaregiverPhone__c FROM Account WHERE id =:recordid];
            system.debug(NerarestPhone);
            return NerarestPhone;
        }catch(Exception e){
            System.debug('Error at line '+e.getLineNumber()+'. '+e.getMessage());
            return NULL;
        }
    } 
}