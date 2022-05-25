public class findAindescription{
    public Static void ProductRecord(){
        try{
            List<Product2> pro=new List<Product2>();
            pro=[SELECT Name From Product2 Where Description Like '%a%'];
            if(Product2.Description !=null){
                for(Product2 p:pro){
                    System.debug(p.Name);
                }
            }
        }
        catch(DMLException e){
            System.debug('ERROR AT LINE '+e.getLineNumber()+'\n'+' '+e.getMessage());
        }
    }
}