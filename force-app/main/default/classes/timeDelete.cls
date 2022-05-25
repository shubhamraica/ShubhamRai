public class timeDelete {
    public static void timeDeleteFunc(){
         List<Time__c> timeList=new List<Time__C>();
            for(Integer i=1;i<=100;i++)
            {
                Time__C timeObj=new Time__C();
                timeObj.Name='TIME '+i;
                timeObj.StartTime__c=Date.today()+i;
                timeObj.EndTime__c=Date.today()+30;
                timeList.add(timeObj);
            }
            insert timeList;
        
    }
}