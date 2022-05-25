public class closeAllOpportunity{
    public static void closeAllOpportunityFunc(List<campaign> campaignList){
        try{
            List<opportunity> oppList=new List<opportunity>();
            List<opportunity> listopp =new List<opportunity>();
            set<id> camid=new set<id>();
            for(campaign cam:campaignList){
                camid.add(cam.id);
            }
            opplist=[select id,campaignid,(select id from opportunitylineitems)from opportunity where  campaignid IN(select id from campaign where id IN:Camid AND status='completed')];
            if(!opplist.isEmpty()){
                for(opportunity op:opplist){
                    opportunity opp=new opportunity();
                    if(op.opportunitylineitems.size()==0){
                        opp.Id=op.id;
                        opp.StageName='closed Lost';
                    }
                    else{
                        opp.Id=op.id;
                        opp.StageName='closed Won';                
                    }
                    listopp.add(opp);
                }
                update listopp;
            }
        }catch(Exception e){
            System.debug('Error at line '+e.getLineNumber()+'. '+e.getMessage());
        }   
    }
}