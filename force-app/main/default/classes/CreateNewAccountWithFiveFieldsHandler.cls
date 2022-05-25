public class CreateNewAccountWithFiveFieldsHandler {
    @auraEnabled
    public static String CreateNewAccountWithFiveFieldsHandlerFunc(String AccountName, Integer NumberOfEmployees, String YearStarted, Integer AnnualRevenue, String Industry){
        try{
            if((AccountName!=NULL)&&(NumberOfEmployees!=NULL)){
                Account accObj = new Account();
                accObj.Name = AccountName;
                accObj.NumberOfEmployees = NumberOfEmployees;
                accObj.YearStarted = YearStarted;
                accObj.AnnualRevenue = AnnualRevenue;
                accObj.Industry = Industry;
                insert accObj;
                return 'Account inserted successfully';
            }
            else if((AccountName==NULL)||(NumberOfEmployees==NULL)){
                return 'You must enter account name and number of employees';
            }
            else{
                return 'unknown error!';
            }
        }catch(Exception e){
            System.debug('Error at line '+e.getLineNumber()+'.'+e.getCause());
        }
        return NULL;
    }
}