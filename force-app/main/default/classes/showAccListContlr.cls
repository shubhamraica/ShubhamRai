public with sharing class showAccListContlr {
    @AuraEnabled(cacheable=true)
    public static List<Contact> conList(){
        try {
            return [SELECT Name, Email FROM Contact LIMIT 5];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled(cacheable=true)
    public static Integer returnString(){
        try {
            return 991199;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    
}