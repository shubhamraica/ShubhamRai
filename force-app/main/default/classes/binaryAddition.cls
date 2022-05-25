public class binaryAddition {
    public static void addTwoBinaryNumbers(){
        try{
            String s1='100101';
            String s2='0101101';
            Integer int1=Integer.valueOf(s1);
            Integer int2=Integer.valueOf(s2);
            Integer carry=0,i=0,j=0;
            String result;
            Integer[] sum=new Integer[10];
            while(int1!=0||int2!=0){
                sum[i++]=(Integer)math.mod((math.mod(int1,10)+math.mod(int2,10)+carry),2);
                carry=(Integer)((math.mod(int1,10)+math.mod(Int2,10)+carry)/2);
                int1=int1/10;
                int2=int2/10;
            }
            if(carry!=0){
                sum[i++]=carry;
            }
            --i;
            while(i-1>=0){
                result=result+String.valueOf(sum[i--]);
            }
            system.debug(result);
        }catch(Exception e){
            System.debug('Error at line number '+e.getLineNumber()+'. '+e.getMessage());
        }
    }
}