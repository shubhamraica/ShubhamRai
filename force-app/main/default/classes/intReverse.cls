public class intReverse {
    public static void rev(){
        try{
            integer n=1234567890,i=0,rem=0;while(n!=0){
                rem= Math.mod(n, 10) ;                
                i=i*10+rem;
                n/=10;
            }
            system.debug(i);
        }catch(Exception e){
            System.debug('ERROR AT LINE '+e.getLineNumber()+'\n'+' '+e.getMessage());
        }
    }
}