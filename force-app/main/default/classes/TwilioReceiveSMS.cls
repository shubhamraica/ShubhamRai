@RestResource(urlMapping='/TwilioReceiveSMS/*')
global class TwilioReceiveSMS {
    @HttpGet
    global static void getSMS() {
        System.debug('******************** STARTING OF TwilioReceiveSMS ********************');
        try{
            // Store the request 
            RestRequest req = RestContext.request;       
            // Store the HTTP parameters from the request in a Map
            Map<String, String> sms = req.params ; 
            System.debug('sms : '+sms.Keyset());
            String fromPhNumber ;
            String smsBody ;                  
            if (sms.containsKey('From')){
                fromPhNumber = sms.get('From') ;
            }
            if (sms.containsKey('Body')){
                smsBody = sms.get('Body') ;
            } 
            System.debug('FROM : '+fromPhNumber);
            System.debug('smsBody  : '+smsBody);
            /*Account acc_obj=[SELECT PatientCellPhone__c, OtherPhone__c, NearestRelativeCaregiverPhone__c FROM Account 
where (PatientCellPhone__c=:fromPhNumber 
OR OtherPhone__c =:fromPhNumber 
OR NearestRelativeCaregiverPhone__c=:fromPhNumber) limit 1];
system.debug('THIS IS DEBUG'+acc_obj);  */          
            SMS__c smsobj = new SMS__c();
            smsobj.Name = smsBody;
            smsobj.phoneNumber__c = fromPhNumber;
            //smsobj.Account__c = acc_obj.Id;
            smsobj.type__c = 'inbound';
            smsobj.UserName__c = UserInfo.getName();   
            insert smsobj;
        }catch(Exception e){
            System.debug('Error at line '+e.getLineNumber()+'. '+e.getMessage());
        }
    }
}