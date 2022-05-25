public class DisplayRichTextHandler {
    public List<Account> accList {set;get;}
    
    public DisplayRichTextHandler(){
        accList = [SELECT Name, RichText__c FROM Account ORDER BY CreatedDate DESC LIMIT 10];
    }
}