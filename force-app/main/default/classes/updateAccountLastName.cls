/*"On Contact to update the Account Name field with contact Last Name, concatenated in the end. 
Example: If you Create A Contact whose FirstName='Andy' and LastName='Cody' and the Accountname ='Ricky', 
Then Account name must become 'Ricky Cody'."*/
public class updateAccountLastName{
    public static void updateAccountNameFunc(List<Contact> contList){
        try{
            Account accObj=new Account();
            accObj=[SELECT id,name FROM Account WHERE id=:contList[0].Accountid];
            accObj.Name=accObj.Name+ contList[0].lastname;
            update accObj;
        }catch(Exception e){
            System.debug('Error at line '+e.getLineNumber()+'. '+e.getMessage());
        } 
    } 
}