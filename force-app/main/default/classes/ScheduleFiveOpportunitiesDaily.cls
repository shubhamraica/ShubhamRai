global class ScheduleFiveOpportunitiesDaily Implements schedulable{
    global void execute(System.SchedulableContext sc){
        FiveOpportunitiesDaily obj = new FiveOpportunitiesDaily();
        Database.executeBatch(obj);
    }
}