public class parentaccount {
    public id accountid {get;set;}
    public List<account> parentList {get;set;}
    public string accountname {get;set;}
    public string accountparentname {get;set;}
    public List<account> accountList {get;set;}
    public List<account> childList {get;set;}
    public parentaccount(){
        accountid=apexpages.currentPage().getparameters().get('id');
        accountList=new list<account>();
        accountList=[select name,id from account where parentid=:accountid];
        childList=new list<account>();
        childList=[select name,id from account where parentid=:accountid];
        system.debug(childlist);
        if(AccountList.size()>0 && AccountList!=null){
            parentList=[Select Name from Account where Id =:AccountList[0].parentId limit 1];
        }
        if(parentList.size()>0){
            AccountParentName=parentList[0].Name;
        }
    }
}