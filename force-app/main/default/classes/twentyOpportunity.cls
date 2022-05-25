public class twentyOpportunity {
    public static void twentyRecords(){
        try{
            List<Opportunity> oppList=new List<Opportunity>();
            for(Integer i=1;i<=20;i++)
            {
                Opportunity oppObj=new Opportunity();
                oppObj.CloseDate=Date.today();
                oppObj.StageName='proposal' +i;
                oppObj.Name='Shubham Rai '+i;
                oppList.add(oppObj);
            }
            insert oppList;
            System.debug(oppList);
        }catch(DMLException e){
            System.debug('ERROR AT LINE '+e.getLineNumber()+' . '+' '+e.getMessage());
        }
    }
}