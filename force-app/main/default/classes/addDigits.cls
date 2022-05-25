public class addDigits {
    public static void addDigitsFunc(){
        try{
            Integer num = 123456;
            integer sum = 0;
            while(num != 0){
                sum = sum + math.mod(num, 10);
                num = num/10;
            }
            System.debug('sum : '+sum);
        }catch(Exception e){
            System.debug(e);
        }
    }
}