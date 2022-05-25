@isTest
public class sumDigitsPhone_test {
	@isTest
    private static void sumDigitsTest(){
        Contact conObj = new Contact();
        conObj.lastname = 'Jackson';
		conObj.Phone = '9999898';
        insert conObj;
        
        Test.startTest();
        sumDigitsPhone.sumDigits();
        Test.stopTest();
    }
}