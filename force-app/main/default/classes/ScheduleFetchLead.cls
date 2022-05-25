public class ScheduleFetchLead implements schedulable{
    public void execute(schedulablecontext sc){
        FetchLeadAndSendMail batchobj=new FetchLeadAndSendMail();
        database.executebatch(batchobj);
    }
}