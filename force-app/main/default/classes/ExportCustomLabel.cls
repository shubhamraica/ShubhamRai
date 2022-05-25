public class ExportCustomLabel {
    public static void generateReportUsingSOQL(){
        try{
            URIWrapper wrapperObj = new URIWrapper();
            Messaging.SingleEmailMessage email=new Messaging.SingleEmailMessage();
            List<LightningUriEvent> UriList = [SELECT CreatedDate, Operation, RecordId, SourceIp FROM LightningUriEvent];
            string uriHeader = 'DATE, EVENT, MESSAGE,\n';
            string uriString = uriHeader; 
            if(UriList !=null && UriList.size()>0){
                for(LightningUriEvent uriObj: UriList){
                    wrapperObj.eventDate = uriObj.CreatedDate;
                    if(uriObj.Operation == 'Read'){
                        wrapperObj.eventType = 'record accessed ';
                        wrapperObj.message = 'Record with id '+uriObj.RecordId+' was accessed';
                    }else if(uriObj.Operation == 'Delete'){
                        wrapperObj.eventType = 'record deleted';
                        wrapperObj.message = 'Record with id '+uriObj.RecordId+' was deleted';
                    }else if(uriObj.Operation == 'Update'){
                        wrapperObj.eventType = 'record updated';
                        wrapperObj.message = 'Record with id '+uriObj.RecordId+' was updated';
                    }else if(uriObj.Operation == 'Create'){
                        wrapperObj.eventType = 'record created';
                        wrapperObj.message = 'Record with id '+uriObj.RecordId+' was created';
                    }
                    string recordString = wrapperObj.eventDate+','+wrapperObj.eventType+','+wrapperObj.message+'\n';
                    uriString = uriString +recordString;
                }
            }
            
            List<ApiEvent> ApiList = [SELECT ApiType, Query, Application, CreatedDate, ApiVersion, ConnectedAppId, Username FROM ApiEvent];
            string apiString; 
            if(ApiList !=null && ApiList.size()>0){
                for(ApiEvent apiObj: ApiList){
                    wrapperObj.apiDate = apiObj.CreatedDate;
                    wrapperObj.apiQuery = apiObj.Query;
                    wrapperObj.apiQuery = wrapperObj.apiQuery.replaceAll(',', '');
                    wrapperObj.apiMessage = apiObj.Username+' has performed '+apiObj.Query;
                    wrapperObj.apiMessage = wrapperObj.apiMessage.replaceAll(',', '');
                    string apirecordString = wrapperObj.apiDate+','+wrapperObj.apiQuery+','+wrapperObj.apiMessage+'\n';
                    apiString = apiString +apirecordString;
                }
            }
            
            List<ListViewEvent> listViewList = [SELECT Scope, EventSource, CreatedDate, ListViewId, Username FROM ListViewEvent];
            string listViewString;
            if(listViewList !=null && listViewList.size()>0){
                for(ListViewEvent listViewObj: listViewList){
                    Datetime CreatedDate = listViewObj.CreatedDate;
                    String ListViewId = listViewObj.ListViewId;
                    String EventSource = listViewObj.EventSource;
                    String Scope = listViewObj.Scope;
                    String Username = listViewObj.Username;
                    String message = Username+' used list view with scope of '+Scope+' from source '+EventSource+' with id '+ListViewId;
                    string listViewrecordString = CreatedDate+','+ListViewId+','+message+'\n';
                    listViewString = listViewString +listViewrecordString;
                }
            }
            
            List<LoginEvent> LoginEventList = [SELECT CreatedDate, Browser, LoginUrl, Status, Username FROM LoginEvent];
            string LoginEventString;
            if(LoginEventList !=null && LoginEventList.size()>0){
                for(LoginEvent LoginEventObj: LoginEventList){
                    Datetime CreatedDate = LoginEventObj.CreatedDate;
                    String Browser = LoginEventObj.Browser;
                    String LoginUrl = LoginEventObj.LoginUrl;
                    String Username = LoginEventObj.Username;
                    String Status = LoginEventObj.Status;
                    String message = Username+' logged in using '+Browser+' browser from'+LoginUrl;
                    string LoginEventrecordString = CreatedDate+','+Status+','+message+'\n';
                    LoginEventString = LoginEventString +LoginEventrecordString;
                }
            }
            
            List<LoginAsEvent> LoginAsEventList = [SELECT Browser, CreatedDate, LoginAsCategory, Platform, Username FROM LoginAsEvent];
            string LoginAsEventListString;
            if(LoginAsEventList !=null && LoginAsEventList.size()>0){
                for(LoginAsEvent LoginAsEventListObj: LoginAsEventList){
                    Datetime CreatedDate = LoginAsEventListObj.CreatedDate;
                    String Browser = LoginAsEventListObj.Browser;
                    String LoginAsCategory = LoginAsEventListObj.LoginAsCategory;
                    String Username = LoginAsEventListObj.Username;
                    String Platform = LoginAsEventListObj.Platform;
                    String message = '';
                    string LoginAsEventrecordString = CreatedDate+','+Username+','+message+'\n';
                    LoginAsEventListString = LoginAsEventListString +LoginAsEventrecordString;
                }
            }
            
            List<ReportEvent> ReportEventList = [SELECT CreatedDate, Username, ReportId, Operation FROM ReportEvent ];
            string ReportEventString;
            if(ReportEventList !=null && ReportEventList.size()>0){
                for(ReportEvent ReportEventObj: ReportEventList){
                    Datetime CreatedDate = ReportEventObj.CreatedDate;
                    String Operation = ReportEventObj.Operation;
                    String message = ReportEventObj.Username+' run report with id '+ReportEventObj.ReportId;
                    string ReportEventStringrecordString = CreatedDate+','+ReportEventObj.Username+','+message+'\n';
                    ReportEventString = ReportEventString +ReportEventStringrecordString;
                }
            }
            
            Map<String,String> attachFiles = new  Map<String,String>();
            String finalFile = uriString+apiString+listViewString+LoginEventString+LoginAsEventListString+ReportEventString;
            attachFiles.put('User Activity',finalFile);
            
            EmailService service=new EmailService(email);
            service.body='Hello, <br/>Here is attached Report.<br/>Thank You.<br/>Admin';
            service.isHtml=true;
            service.toAddresses=new List<string>();
            service.toAddresses.add('shubham.rai@cloudanalogy.com');  
            service.displayName='Shubham Rai ADMIN';
            service.isAttachment = true;
            service.attachFiles = attachFiles;
            service.subject='User\'s Activity Report';
            service.sendMail();
        }catch(Exception ex){
            system.debug(ex.getMessage());
        }
    }
    public class URIWrapper{
        public datetime eventDate;
        public String eventType;
        public String message;
        public datetime apiDate;
        public String apiType;
        public String apiMessage;
        public String apiQuery;
    }
}