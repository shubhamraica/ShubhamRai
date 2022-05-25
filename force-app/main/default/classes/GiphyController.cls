public class GiphyController {
    @AuraEnabled
    public static String getGIF(String query){
        try{
            Http http = new Http();
            HttpRequest RestRequest = new HttpRequest();
            RestRequest.setEndpoint('http://api.giphy.com/v1/gifs/search?api_key=WU3hMlNAXHX9gUpvNUSSlN098nI0Ce10&q='+query);
            RestRequest.setMethod('GET');  
            HTTPResponse RestResponse = http.send(RestRequest); 
            if(RestResponse.getStatusCode()==200){
                List<String> returingValue = new List<String>();
                Map<String, Object> response = (Map<String, Object>) JSON.deserializeUntyped(RestResponse.getBody());
                List<Object> data = (List<Object>)(response.get('data'));
                for(Object dataObj : data){
                    Map<String, Object> insideData = (Map<String, Object>)dataObj; 
                    Map<String, Object> images = (Map<String, Object>)insideData.get('images');
                    Map<String, Object> downsized = (Map<String, Object>)images.get('downsized');
                    String downsizedURL = String.valueof(downsized.get('url'));
                    returingValue.add(downsizedURL);
                }
                return JSON.serialize(returingValue);
            }else{
                return NULL;
            }
        }catch(Exception e){
            System.debug('Error at line '+e.getLineNumber()+'. '+e.getMessage());
            return NULL;
        }
    }
}