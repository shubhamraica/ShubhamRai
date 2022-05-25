public class News {
    @AuraEnabled public static String getNews(String country, String category){
        try{
            Http http = new Http();
            HttpRequest RestRequest = new HttpRequest();
            RestRequest.setEndpoint('https://newsapi.org/v2/top-headlines?country='+country+'&apiKey=61565c3d83d24178a3dd2eaa8166848d&category='+category);
            RestRequest.setMethod('GET');
            HTTPResponse RestResponse = http.send(RestRequest);
            if(RestResponse.getStatusCode()==200){
                List<String> Report = new List<String>();
                Map<String, Object> response = (Map<String, Object>) JSON.deserializeUntyped(RestResponse.getBody());
                List<Object> articles = (List<Object>)(response.get('articles'));
                for(Object articlesObj : articles){
                    Map<String, Object> insideArticles = (Map<String, Object>)articlesObj;
                    String Title = String.valueOf(insideArticles.get('title'));
                    Report.add(Title);
                }
                return JSON.serialize(Report);
            }else{
                return NULL;
            }
        }catch(Exception e){
            System.debug('Error at line '+e.getLineNumber()+'. '+e.getMessage());
            return NULL;
        }
    }
    
    @AuraEnabled public static String getNewsAgain(String country, String category){
        try{
            Http http = new Http();
            HttpRequest RestRequest = new HttpRequest();
            RestRequest.setEndpoint('https://newsapi.org/v2/top-headlines?country='+country+'&apiKey=61565c3d83d24178a3dd2eaa8166848d&category='+category);
            RestRequest.setMethod('GET');
            HTTPResponse RestResponse = http.send(RestRequest);
            if(RestResponse.getStatusCode()==200){
                List<respWrap> respWrapList = new List<respWrap>();
                Map<String, Object> response = (Map<String, Object>) JSON.deserializeUntyped(RestResponse.getBody());
                List<Object> articles = (List<Object>)(response.get('articles'));
                for(Object articlesObj : articles){
                    Map<String, Object> insideArticles = (Map<String, Object>)articlesObj;
                    String Title = String.valueOf(insideArticles.get('title'));
                    String Url = String.valueOf(insideArticles.get('url'));
                    respWrap respWrapObj = new respWrap();
                    respWrapObj.newsTitle = Title;
                    respWrapObj.newsurl = Url;
                    respWrapList.add(respWrapObj);
                }
                return json.serialize(respWrapList);                
            }else{
                return NULL;
            }
        }catch(Exception e){
            System.debug('Error at line '+e.getLineNumber()+'. '+e.getMessage());
            return NULL;
        }
    }
    
    public class respWrap{
        public String newsTitle;
        public String newsurl;
    }
}