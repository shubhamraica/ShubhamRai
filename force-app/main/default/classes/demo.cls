public class demo{
    public static void demoFunc(){
        List<Account> accList= new List<Account>();
        acclist = [SELECT id FROM Account];
        
        List<Contact> contList  = new List<Contact>();
        contList = [Select Firstname FROM Contact WHERE AccountId =: accList];
        
        List <Opportunity> oppList = new List<Opportunity>();
        OppList = [SELECT Name FROM Opportunity WHERE AccountId =: accList];
        Integer counter=0;
        for(Contact c:contList){
            for(Opportunity o:oppList){
                if(c.firstName == o.Name){
                    counter++;
                }
            }
        }
        System.Debug(counter);
    }
}