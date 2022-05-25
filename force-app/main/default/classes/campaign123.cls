public class campaign123{
    public static void showActiveCampaign()
    {
        try{
            List<CampaignMember> CM=new List<CampaignMember>();
            List<Campaign> ActiveCampaign=new List<Campaign>();
            set<id> Cid=new set<id>();CM=[SELECT CampaignId FROM CampaignMember Where LeadId!=null];
            if(!CM.isEmpty()){
                for(CampaignMember C:CM){
                    System.debug('Campaign Id :- '+C.Id+'\n Campaign Name :- '+C.Name);
                }
            }
        }catch(Exception e){
            System.debug('ERROR AT LINE '+e.getLineNumber()+' . '+' '+e.getMessage());
        }
    }
}