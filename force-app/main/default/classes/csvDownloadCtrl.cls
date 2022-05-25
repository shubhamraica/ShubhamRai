public class csvDownloadCtrl {
    @AuraEnabled
    public static list <Account> fetchAccount(){
        try{
            List <Account> accList = new List <Account>();
            accList = [SELECT Name, (SELECT LastName from Contacts ), Industry, Phone, Status__c, Price__c, TextPrice__c 
                       FROM Account WHERE Status__c = 'Available' order by createdDate DESC LIMIT 10];
            for(Account obj : accList){
                obj.TextPrice__c =String.valueOf('£ '+obj.Price__c);
                //obj.TextPrice__c = EncodingUtil.urlEncode(String.valueOf('£ '+obj.Price__c),'utf-8');
            }
            return accList;
        }catch(Exception e){
            System.debug('Error at line '+e.getLineNumber()+'. '+e.getMessage());
            return NULL;
        }
    }
}