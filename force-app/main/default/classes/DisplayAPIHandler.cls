public class DisplayAPIHandler{
    @AuraEnabled
    public static List<string> getAllObjects(){
        List<string> SObjectList = new List<string>();
        for(Schema.SObjectType objTyp : Schema.getGlobalDescribe().Values()){
            String name = objTyp.getDescribe().getName();
            SobjectList.add(name);
        }
        return SObjectList;
        
    }
    @AuraEnabled
    public static List<String> getAllFields(String fld){
        List<String> fieldList = new List<String>();
        Map<String,Schema.SObjectType> gd = Schema.getGlobalDescribe(); 
        Schema.SObjectType sobjType = gd.get(fld); 
        Schema.DescribeSObjectResult describeResult = sobjType.getDescribe(); 
        Map<String,Schema.SObjectField> fieldsMap = describeResult.fields.getMap(); 
          /* for(string str: fieldsMap.keySet()){
fieldList.add(fieldsMap.get(str).getDescribe().getLabel());                  //getName will give API name of Fields
           } */
        for (String str: fieldsMap.keySet()) {
            fieldList.add(fieldsMap.get(str).getDescribe().getName());
        } 
        
        return fieldList;      
    }
    
}