public class AccountRelated{
    public WrapperClass wrapperClassObj{get;set;}
    public AccountRelated(){
        wrapperClassObj = new WrapperClass();
        List<Contact> conList = new List<Contact>();
        conList = [SELECT Name FROM Contact LIMIT 1];
        wrapperClassObj.conObj = conList;
    } 
    public class WrapperClass{
        public List<Contact> conObj{get;set;}
    }
}