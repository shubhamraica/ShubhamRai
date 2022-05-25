public class contactsOnAccountsExtension{
private final Account acct;
public Integer countContact {get; set;}

        public contactsOnAccountsExtension(ApexPages.StandardController stdController) {
        this.acct = (Account)stdController.getRecord();
        countContact = [SELECT count() FROM Contact WHERE AccountId ='0015g0000099SQlAAM'];            
    }
}