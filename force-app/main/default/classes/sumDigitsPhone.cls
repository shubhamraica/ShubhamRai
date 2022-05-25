public class sumDigitsPhone {
    public static void sumDigits(){
        try{
            List<Contact> conList = new List<Contact>();
            Set<Contact> CloneConSet = new Set<Contact>();     
            List<Contact> secondList = new List<Contact>();
            conList = [SELECT Phone FROM Contact WHERE phone != NULL LIMIT 5000];            
            system.debug('all conList : '+conList);
            if(conList.size()>0 && conList != NULL){
                for(Integer i = 0; i < (conList.size()); i++){
                    Integer n = Integer.valueOf(conList[i].Phone);
                    System.debug('value of each phone : '+n);
                    Integer sum = 0;
                    while (n != 0) {
                        sum = sum + math.mod(n, 10);
                        n = n / 10;
                        if(sum > 30 ){
                            System.debug('conList[i].Phone');
                            secondList.add(conList.remove(i));
                        }
                    }                    
                }
            }
            update conList;
            System.debug('secondList : '+secondList);
            
            if(secondList.size()>0 && secondList != NULL){
                List<Contact> thirdList = secondList.clone();
                system.debug('thirdList : '+thirdList);
            }
            
            if(secondList.size()>0 && secondList != NULL){
                delete secondList;       
            }  
            system.debug('all conList in end : '+conList);
        }catch(Exception e){
            System.debug('Error at Line number '+e.getLineNumber()+'.'+e.getMessage());
        }
    }
}