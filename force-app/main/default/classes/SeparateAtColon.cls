public class SeparateAtColon {
    public static void splitAtSemicolon(){
        try{
            Account accObj = [SELECT orgName__c FROM Account WHERE id = '0015g00000Qs7jSAAR'];
            
            string sString = 'e:emial@gmail.com;p:ca00790;h:helper123';
            string[] splitted = sString.split(';');
            System.debug('Before :'+sString);
            for(Integer i=0; i<splitted.size(); i++){
                System.debug('ELEMENT : '+splitted[i]);
            }
            
        }catch(exception e){
            System.debug(e.getMessage());
        }
    }
}