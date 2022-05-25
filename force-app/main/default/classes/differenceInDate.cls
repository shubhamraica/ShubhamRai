public class differenceInDate{
    public static void diffDate(){
        try{
            datetime date1 = datetime.newInstance(2020,11,30,10,2,30);
            datetime date2 = datetime.newInstance(2021,12,31,10,10,40);
            System.debug('DIFFERENCE IN MONTHS IS '+(date1.year()-date2.year())+' Years');
            System.debug('DIFFERENCE IN MONTHS IS '+(date1.month()-date2.month())+' Months');
            System.debug('DIFFERENCE IN DAYS IS '+(date1.day()-date2.day())+' Days');
            System.debug('DIFFERENCE IN HOURS IS '+(date1.hour()-date2.hour())+' Hours');
            System.debug('DIFFERENCE IN HOURS IS '+(date1.minute()-date2.minute())+' Minutes');
            System.debug('DIFFERENCE IN HOURS IS '+(date1.second()-date2.second())+' Seconds');
        }catch (Exception e){
            System.debug('ERROR AT LINE '+e.getLineNumber()+'\n'+' '+e.getMessage());
        }
    }
}