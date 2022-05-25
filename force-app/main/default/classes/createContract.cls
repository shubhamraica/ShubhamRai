public class createContract{
    public static void createContractWithSameDetails(){
        try{
            List<Contract> contrList1 = new List<Contract>();
            contrList1 = [SELECT id,accountid,CustomerSignedId, Status,StartDate FROM contract WHERE accountid!=:NULL AND CustomerSignedId!=: NULL];
            System.debug('\n\nOLD CONTRACT : '+contrList1);
            List<Contract> contrList2 = new List<Contract>();
            for(Contract contr :contrList1){
                Contract contrObj = new Contract();
                contrObj.AccountId=contr.AccountId;
                contrObj.CustomerSignedId=contr.CustomerSignedId;
                contrObj.StartDate=contr.StartDate;
                contrObj.Status=contr.Status;
                contrList2.add(contrObj); 
            }
            insert contrList2;
            System.debug('\n\nNEW CONTRACT : '+contrList2);
        }catch(Exception e){
            System.debug('ERROR AT LINE '+e.getLineNumber()+'\n'+' '+e.getMessage()); 
        }
    }
}