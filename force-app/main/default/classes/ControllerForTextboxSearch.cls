public class ControllerForTextboxSearch{
    public String searchstring { get; set; } 
    public list<Account> accountList{get;set;} 
    public list<list<Account>> accList{get;set;}
    public ControllerForTextboxSearch(){
        accountList = new list<Account>();
        accountList = [SELECT id,name,Phone,Billingcity,BillingPostalcode FROM Account LIMIT 100];    
    }
    public void search(){
        accountList.clear();
        accountList = [SELECT id,name,Phone,Billingcity,BillingPostalcode FROM Account WHERE Name =:searchstring
                       OR Phone =:searchstring OR Billingcity =:searchstring OR BillingPostalcode =:searchstring];     
    }
    public void clear(){
        accountlist.clear();
        accountList = [SELECT id,name,Phone,Billingcity,BillingPostalcode FROM Account LIMIT 100];
    }
}