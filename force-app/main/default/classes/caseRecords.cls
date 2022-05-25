public class caseRecords{
    public static void createFiveCaseRecord(){
        try{
            List<Case> caseList = new List<Case>();
            List<Contact> contList = new List<Contact>();
            contList = [SELECT id,accountid FROM contact LIMIT 5];
            for(contact conts:contList){
                case caseObj = new case();
                caseObj.ContactId = conts.id;
                caseObj.AccountId = conts.AccountId;
                caseList.add(caseObj);
            }
            insert caseList;        
            System.debug(caseList);
        }catch(Exception e){
            System.debug('Error at line number '+e.getLineNumber()+'. '+e.getMessage());
        }
    }
}