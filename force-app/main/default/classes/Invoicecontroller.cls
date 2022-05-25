public class Invoicecontroller {
    public String dateVar{get;set;}
    public list<Opportunity> oppobj{get;set;}
    public list<OpportunityContactRole> ocrobj{get;set;}
    public list<OpportunityLineItem> oliobj{get;set;}
    public list<Contact> Contactobj{get;set;}
    public list<Product2> productlist{get;set;}
    public integer sum{get;set;}
    public  Invoicecontroller(){
        Contactobj=new list<Contact>();
        oppobj=new list<Opportunity>();
        oppobj=[select id,name from opportunity where name='17 april opportunity'];
        Ocrobj=new list<OpportunityContactRole>();
        oliobj=new list<OpportunityLineItem>();       
        set<Id>opportunityset=new set<Id>();
        for(Opportunity oppid:oppobj)
        {
         opportunityset.add(oppid.id);   
        }
     Ocrobj=[select id,contactid,opportunityid from OpportunityContactRole where opportunityid in:opportunityset];
     oliobj=[select id,Quantity,unitprice,Description,opportunityid from Opportunitylineitem where opportunityid in:opportunityset];
     set<Id>opportunitycontactroleset=new set<Id>();
        for(opportunitycontactrole ocrid:Ocrobj)
        {
         opportunitycontactroleset.add(ocrid.contactid);   
        }
     contactobj=[select id,name,MailingStreet,MailingCity,Phone,Email from Contact where id in :opportunitycontactroleset];
     this.sum=0;
     for(OpportunityLineItem oliobj1:oliobj)
     {
        this.sum=this.sum+integer.valueof( oliobj1.UnitPrice*oliobj1.Quantity);
     }
        dateVar = date.today().format();
    }
}