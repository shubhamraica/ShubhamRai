public class OpenWeatherMap {
    @AuraEnabled
    public static String getWeather(String city){
        try{
            Http http = new Http();
            HttpRequest RestRequest = new HttpRequest();
            RestRequest.setEndpoint('http://api.openweathermap.org/data/2.5/weather?q='+city+'&appid=c63778dd0fc88128afba64120b7ffe05');
            RestRequest.setMethod('GET');  
            HTTPResponse RestResponse = http.send(RestRequest); 
            if(RestResponse.getStatusCode()==200){
                Map<String, String> Report = new Map<String, String>();
                Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(RestResponse.getBody());
                Map<String, Object> mainResults = (Map<String, Object>)(results.get('main'));
                String temp = String.valueOf(mainResults.get('temp'));
                System.debug('temp : '+temp);
                String temp_min = String.valueOf(mainResults.get('temp_min'));
                System.debug('temp_min : '+temp_min);
                String temp_max = String.valueOf(mainResults.get('temp_max'));
                System.debug('temp_max : '+temp_max);
                List<Object> weatherResults = (List<Object>)(results.get('weather'));
                Report.put('Temperature',temp);
                Report.put('Temperature_min',temp_min);
                Report.put('Temperature_max',temp_max);
                for(Object r : weatherResults){
                    Map<String, Object> result = (Map<String, Object>)r;
                    String weatherDesc = String.valueOf(result.get('description'));
                    Report.put('Description',weatherDesc);
                    String icon = String.valueOf(result.get('icon'));
                    Report.put('icon',icon);
                }
                System.debug('The List which is returning from APEX CLASS : '+Report);
                return JSON.serialize(Report);
            }else{
                return NULL;
            }
        }catch(Exception e){
            System.debug('Error at line '+e.getLineNumber()+'. '+e.getMessage());
            return NULL;
        }
    }
}