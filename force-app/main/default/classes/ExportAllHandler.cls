public class ExportAllHandler{
    public List<Account> accList {set;get;}
    public List<Account> acct{get;set;}
    public string renderAsdoc{get;set;}
    public boolean pb1{get;set;}
    public string renderAsExcel{get;set;}
    
    public ExportAllHandler(){
        accList = [SELECT Name, (SELECT LastName from Contacts ), Industry, Phone, Status__c, Price__c, TextPrice__c 
                   FROM Account WHERE Status__c = 'Available' order by createdDate DESC LIMIT 10];
        for(Account obj : accList){
            obj.TextPrice__c =String.valueOf('£ '+obj.Price__c);
            pb1=true;
        }
    }
    //pdf generate
    public PageReference SaveAspdf() {
        pb1=false;
        renderAsdoc='pdf';
        string fileName = 'Account.pdf';
        Apexpages.currentPage().getHeaders().put('content-disposition', 'attachemnt; filename='+fileName);
        return null;
    }

    //Save as Excel
    public PageReference SaveAsExcel() {
        renderAsExcel='application/vnd.ms-excel#Account Report.xls'; //text/xml#account.xls   Charset=UTF-16,text/csv#Account.csv
        return null;
    }
}