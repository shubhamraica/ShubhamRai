@isTest
public class ControllerForDatatable_Test {
    @isTest static void testMethod1(){
        Account obj1 = new Account();
        obj1.Name = 'testName';
        obj1.NumberOfEmployees = 1;
        insert obj1;
        Contact obj2 = new Contact();
        obj2.LastName = 'testLastName';
        insert obj2;
        ControllerForDatatable obj = new ControllerForDatatable();
    }
}