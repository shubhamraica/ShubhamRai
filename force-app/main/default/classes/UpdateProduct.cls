public class UpdateProduct{
    public static void updateProductFunc(list<opportunity>opprList){
        integer counter=0;
        set<Id>opportunityset=new set<Id>();
        set<Id>opportunityaccountset=new set<Id>();
        for(opportunity oppobj:opprList){
            opportunityset.add(oppobj.id);
            opportunityaccountset.add(oppobj.accountid);
        }
        list<OpportunityLineItem>oliList=new list<OpportunityLineItem>();
        oliList=[select id,opportunityid,product2id from OpportunityLineItem where opportunityid in:opportunityset];
        set<Id>Productset=new set<Id>();
        for(opportunitylineitem oli:oliList){
            Productset.add(oli.product2id);
        }
        list<Product2>productlist=new list<Product2>();
        productlist=[select id,name  from product2 where id in:Productset];
        for(opportunity oppobj:opprList) {
            if(oppobj.StageName=='closed lost'){ 
                for(Product2 proobj:productlist){
                    counter++;
                }
            }
        }
        list<Account> accountlist=new list<Account>();
        accountlist=[select id from account where id in: opportunityaccountset];
        list<Account> accountlist2=new list<Account>();
        for(Account acobj:accountlist){ 
            Account ac=new Account();
            ac.id=acobj.id;
            ac.numberOfProductsSold__c = counter;
            accountlist2.add(ac);
        }
        update accountlist2;
    }         
}