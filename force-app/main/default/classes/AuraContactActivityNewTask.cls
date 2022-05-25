public class AuraContactActivityNewTask{
    //create task method
    @AuraEnabled
    public static Boolean createTask(Task taskvalue)
    {
        try{
            if(string.isNotEmpty(taskvalue.Status) && string.isNotEmpty(taskvalue.OwnerId))
            {
                Task taskobj=new Task();
                taskobj.Subject = taskvalue.subject;
                taskobj.Status = taskvalue.Status;
                taskobj.ActivityDate = taskvalue.ActivityDate;
                taskobj.WhatId = taskvalue.WhatId;
                taskobj.WhoId = taskvalue.WhoId;
                taskobj.OwnerId = taskvalue.OwnerId;
                taskobj.Priority = 'High';
                insert taskobj;
                return true;
            }
        }
        catch(Exception e)
        {
            system.debug(e.getLineNumber()+e.getMessage());
        }
        return false;
    }
}