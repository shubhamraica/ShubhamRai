public class AuraAccountCreationHandler {
    @AuraEnabled
    public static List<Contact> FetchContact(){
        try{
            List<Contact>showContacts =[SELECT Id,Name,LastName FROM Contact limit 50000];
            system.debug(showContacts);
            if(showContacts.size()>0)
            {
                return showContacts;
            }
        }
        catch(Exception e)
        {
            system.debug(e.getLineNumber()+e.getMessage());
        }
        return null;
    }
    @AuraEnabled
    public static List<Account> FetchAccount(){
        try{
            List<Account>showAccounts =[SELECT Id,Name FROM Account limit 50000];
            if(showAccounts.size()>0)
            {
                return showAccounts;
            }
        }
        catch(Exception e)
        {
            system.debug(e.getLineNumber()+e.getMessage());
        }
        return null;
    }
    @AuraEnabled
    public static List<User> FetchUser(){
        try{
            List<User>showUser =[SELECT Id,Name FROM User limit 50000];
            if(showUser.size()>0)
            {
                return showUser;
            }
        }
        catch(Exception e)
        {
            system.debug(e.getLineNumber()+e.getMessage());
        }
        return null;
    }
    @AuraEnabled
    public static Boolean createTask(string subject,string status,date selecteddate,
                                     string contactname,string Accountname,string user)
    {
        try{
            Task taskobj=new Task();
            taskobj.Subject=subject;
            taskobj.Status=status;
            taskobj.ActivityDate=selecteddate;
            taskobj.WhatId=Accountname;
            taskobj.WhoId=contactname;
            taskobj.OwnerId=user;
            taskobj.Priority='High';
            insert taskobj;
            return true;
        }
        catch(Exception e)
        {
            system.debug(e.getLineNumber()+e.getMessage());
        }
        return false;
    }
}