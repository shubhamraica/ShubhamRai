/*Write a trigger on contact if a checkbox [COPY ADDRESS FROM ACCOUNT]
If this check box is true copy the Account's Billing Address to Contact Mailing address on insert and update.*/
public class CopyBillingAddress{
    public static void CopyBillingAddressFunc(list<Contact> contactlist){
        try{ 
            set<Id>accountid=new set<Id>();
            for(contact con:contactlist){
                accountid.add(con.accountid);
            }
            set<Id>contactid=new set<Id>();
            for(contact con:contactlist){
                contactid.add(con.id);
            }
            list<Account>accountlist=new list<Account>();
            accountlist=[select id,BillingStreet,BillingCity,BillingState,BillingPostalCode,BillingCountry from account
                         where Id in :accountid];
            list<contact>contactlist2=new list<contact>();
            contactlist2=[select id,Lastname from contact where id in: contactid];
            for(Account ac:accountlist){
                for(Contact conn:contactlist2){
                    if(conn.Copy_address_from_account__c=true){
                        conn.MailingStreet     = ac.BillingStreet;
                        conn.MailingCity       = ac.BillingCity;
                        conn.MailingState      = ac.BillingState;
                        conn.MailingPostalCode = ac.BillingPostalCode;
                        conn.MailingCountry    = ac.BillingCountry;
                    }
                }
            }
            update contactlist2;
        }catch (Exception e){
            System.debug('ERROR AT LINE '+e.getLineNumber()+'\n'+' '+e.getMessage());
        }
    }
}