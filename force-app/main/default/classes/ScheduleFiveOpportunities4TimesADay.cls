//Schedule the above class to run 4 times every day at after every 6 hours.
global class ScheduleFiveOpportunities4TimesADay Implements schedulable{
    global void execute(System.SchedulableContext sc){
        FiveOpportunitiesDaily obj = new FiveOpportunitiesDaily();
        Database.executeBatch(obj);
    }
}