public class opportunityhide{
    public boolean isTrue{get;set;}
    public boolean dadasda{get;set;}
    public Opportunity opp{get;set;}
    
    public opportunityhide(ApexPages.StandardController controller){
        dadasda = false;
        opp =(opportunity) controller.getRecord();
    }
    public void onCHeck(){
        if(opp.stageName=='Closed Won'){
            dadasda = true;
        }
        else { 
            dadasda = false; 
        }
    }
}