public class fecthPicklistValues {
public static void fecthPicklistValuesFunc(){
    List<String> pickListValuesList= new List<String>();
    Schema.DescribeFieldResult fieldResult = Account.Rating.getDescribe();
    List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
    for( Schema.PicklistEntry pickListVal : ple){
        pickListValuesList.add(pickListVal.getLabel());
    }     
    system.debug('pickListValuesList : '+pickListValuesList);
    
    
}
    
    public static void separateValues(){
        List<String> values = new List<String>();
        values.add('apple');
        values.add('allis');
        values.add('van');
        values.add('cat');
        values.add('alaska');
        values.add('chips');
        
        system.debug('The values are : '+values);
        Map<String,String> fixedMap = new Map<String, String>();
        
    }
    
}