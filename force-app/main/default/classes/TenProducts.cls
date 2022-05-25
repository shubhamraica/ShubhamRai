public class TenProducts{
    public static void productRecord(){
        try{
            List<Product2> prodList=new List<Product2>();
            for(Integer i=1;i<=10;i++){
                Product2 prodObj=new Product2();
                prodObj.Name='productName'+ i;
                prodObj.Family='productType'+ i;
                prodObj.Description='This is description '+ i;
                prodList.add(prodObj);
            }
            insert prodList;
        }catch(Exception e){
            System.debug('Error at line number '+e.getLineNumber()+'. '+e.getMessage());
        }
    }  
}