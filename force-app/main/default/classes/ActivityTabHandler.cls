public class ActivityTabHandler {
    @AuraEnabled
    public static boolean insertTask(Task TaskDetail){
        try{
            Task taskObj = new Task();
            taskObj.Subject = TaskDetail.Subject;			
            System.debug(taskObj.Subject);
            taskObj.ActivityDate =TaskDetail.ActivityDate;		
            System.debug(taskObj.ActivityDate);
            taskObj.WhoId = TaskDetail.WhoId;				
            System.debug(taskObj.WhoId);
            taskObj.WhatId = TaskDetail.WhatId;			
            System.debug(taskObj.WhatId);
            taskObj.OwnerId = UserInfo.getUserId();			
            System.debug(taskObj.OwnerId);
            taskObj.Status = TaskDetail.Status;			
            System.debug(taskObj.Status);
            insert taskObj;
            return TRUE;
        }catch(exception e){
            system.debug('Error at line '+e.getLineNumber()+'. '+e.getMessage());
            return FALSE;
        }     
    }
        @AuraEnabled
    public static boolean insertLogTask(Task TaskLogDetail){
        try{
            Task taskLogObj = new Task();
            taskLogObj.Status = 'Completed';
            taskLogObj.TaskSubtype = 'Call';
            taskLogObj.Description = TaskLogDetail.Description;			
            taskLogObj.Subject = TaskLogDetail.Subject;		
            taskLogObj.WhoId = TaskLogDetail.WhoId;	
            taskLogObj.WhatId = TaskLogDetail.WhatId;	
            insert taskLogObj;
            return TRUE;
        }catch(exception e){
            system.debug('Error at line '+e.getLineNumber()+'. '+e.getMessage());
            return FALSE;
        }     
    }
    @AuraEnabled
    public static boolean insertEvent(Event eventDetail){
        try{
            Event eventObj = new Event();		
            eventObj.Subject = eventDetail.Subject;		
            System.debug(eventObj.Subject);
            eventObj.StartDateTime = eventDetail.StartDateTime;
            System.debug(eventObj.StartDateTime);
            eventObj.EndDateTime = eventDetail.EndDateTime;
            System.debug(eventObj.EndDateTime);
            eventObj.IsAllDayEvent = eventDetail.IsAllDayEvent;
            System.debug(eventObj.IsAllDayEvent);
            eventObj.WhoId = eventDetail.WhoId;	
            System.debug(eventObj.WhoId);
            eventObj.WhatId = eventDetail.WhatId;	
            System.debug(eventObj.WhatId);
            eventObj.OwnerId = eventDetail.OwnerId;
            System.debug(eventObj.OwnerId);
            eventObj.Location = eventDetail.Location;
            System.debug(eventObj.Location);
            insert eventObj;
            return TRUE;
        }catch(exception e){
            system.debug('Error at line '+e.getLineNumber()+'. '+e.getMessage());
            return FALSE;
        }     
    }
    @AuraEnabled
    //name method
    public static list<sObject> FetchName(string objName){
        try{
            string query='select Name from '+objName;
            List<sObject>showName = database.query(query);
            system.debug(showName);
            if(showName.size()>0)
            { 
                return showName;
            }
        }   
        catch(Exception e)
        {
            system.debug(e.getLineNumber()+e.getMessage());
        }
        return null;
    }
    //related to
    @AuraEnabled
    public static list<sObject> FetchRelatedTo(string obj_Name){
        try{
            //string fieldname= obj_Name== 'Case'?'CaseNumber':'Name';
            //system.debug(fieldname);
            //string query='select '+fieldname+' from '+obj_Name;
            string query='select Name from '+obj_Name;
            List<sObject>showrelatedto = database.query(query);
            system.debug(showrelatedto);
            if(showrelatedto.size()>0){
                return showrelatedto;
            }
        }
        catch(Exception e){
            system.debug(e.getLineNumber()+e.getMessage());
        }
        return null;
    }
    //assigned to method
    @AuraEnabled
    public static list<sObject> FetchAssignedto(string obj_User){
        try{
            string query='select Name from '+obj_User;
            List<sObject>showassignedto = database.query(query);
            system.debug(showassignedto);
            if(showassignedto.size()>0)
            {
                return showassignedto;
            }
        }
        catch(Exception e)
        {
            system.debug(e.getLineNumber()+e.getMessage());
        }
        return null;
    }
}