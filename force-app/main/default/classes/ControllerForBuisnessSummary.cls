public class ControllerForBuisnessSummary{
    public List<AccountWrapper> wrapperObj{get; set;}
    public map<Id,List<Opportunitylineitem>> idvsint{get;set;}
    public List<Opportunitylineitem> olilist{get; set;}
    public ControllerForBuisnessSummary(){
        List<Account> account= new List<Account>();
        olilist = new List<Opportunitylineitem>();
        idvsint = new Map<Id,List<Opportunitylineitem>>();
        account=[select Id,Name,(select Id from contacts),(select Id from opportunities)
                 from Account];
        set<Id> accountId = new set<Id>();
        for(Account acc :account){
            accountId.add(acc.id);
        }
        olilist =[select Id, opportunityid,opportunity.accountId from opportunitylineitem where opportunity.accountId IN: accountId ];
        system.debug('olilist'+olilist);
        for(opportunitylineitem oli :olilist){
            if(!idvsint.containskey(oli.opportunity.accountId)){
                idvsint.put(oli.opportunity.accountId,new List<Opportunitylineitem>());
            }
            idvsint.get(oli.opportunity.accountId).add(oli);
        }
        wrapperObj = new List<AccountWrapper>();
        for(Account acc :account){
            AccountWrapper obj = new AccountWrapper();
            obj.id = acc.id;
            obj.Name = acc.NAme;
            obj.ContactSize = acc.contacts.size();
            obj.OpportunitySize = acc.opportunities.size();
            if(idvsint.containsKey(acc.Id)){
                obj.OLISize = idvsint.get(acc.id).size();
            }
            else{
                obj.OLISize = 0;
            }
            wrapperObj.add(obj);
        }
    }
    public class AccountWrapper{
        public String Id{get;set;}
        public String Name{get;set;}
        public Integer ContactSize{get;set;}
        public Integer OpportunitySize{get;set;}
        public Integer OLISize{get;set;}
    }
}