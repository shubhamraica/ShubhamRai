public class activeCampaignDetails{
    public static void campaignDetails(){
        List<Campaign> campList = new List<Campaign>();
        List<CampaignMember> campMemList = new List<CampaignMember>();
        campMemList = [SELECT CampaignID , Name, Status FROM CampaignMember Where LeadId!= NULL];
        System.debug(campMemList);
        set<id> CId = new set <id>();
        for(CampaignMember campMem : campMemList ){
            Cid.add(campMem.CampaignID); 
        }
        campList = [Select Id,Name, Status, StartDate FROM Campaign WHERE Id IN : Cid AND  IsActive = TRUE LIMIT 1];
        
        System.debug('campList>>>>>>>>'+campList);
    }
}