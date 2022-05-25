public class addAllcontacts{
    public static void addAllcontactsFunc(list<opportunity> oppList){
        set<id> ids =new set<id>();
        for(opportunity opposId : oppList){
            ids.add(opposId.accountid);
        }
        list<contact> ContatAccound = new list<contact>();
        ContatAccound=[select id,name,lastname from contact where contact.accountid IN : ids];
        list<opportunityContactRole> ConRole=new list<opportunityContactRole>();
        for(opportunity oppsContainIds:oppList){
            for(contact con:ContatAccound) {
                opportunityContactRole conRoleObj=new opportunityContactRole();
                conRoleObj.ContactId=con.ID;
                conRoleObj.OpportunityId=oppsContainIds.ID;
                ConRole.add(conRoleObj);
            }
        }
        insert ConRole;
    }
}