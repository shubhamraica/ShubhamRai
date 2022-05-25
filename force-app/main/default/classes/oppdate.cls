public class oppdate{
    public string abc{get;set;}
    public boolean flag{get;set;}
    public oppdate(ApexPages.StandardController controller) {
        String abc = controller.getId();
        opportunity oppobject =[SELECT id,CloseDate FROM opportunity where id = :abc];
        if(oppobject.CloseDate >= Date.Today() && oppobject.CloseDate<= Date.Today().addDays(4)){
            flag=true;
        }
        else{
            flag=false;
        }
    }
}