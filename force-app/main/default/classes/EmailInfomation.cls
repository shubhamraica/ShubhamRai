public class EmailInfomation {
     @AuraEnabled
    public static User getsEmails()
    {
        try
        {
            User userInfoObj = [Select Email from User where Id =: userInfo.getUserId() Limit 1];
            System.debug('userInfoList'+userInfoObj);
            return userInfoObj;
        }catch(Exception ex)
        {
            System.debug('Exception is-- '+ex.getMessage()+' at line-->'+ex.getLineNumber());
            
        }
        return null;
    }
    @AuraEnabled
    public static void sendmail(List<String> to, List<String> cc, List<string> bcc,string subject,string emailfrom,string Body)
    { try{
        //system.debug(to[0]+'' + cc[0]+'' + bcc[0]+''+ subject+'' + emailfrom +''+ ''+Body);
        
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setToAddresses(to);
        mail.setCcAddresses(cc);
        mail.setBccAddresses(bcc);
        mail.setReplyTo(emailfrom);
        mail.setSubject(subject);
        mail.setHtmlBody(Body);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        //return true;
    }
     catch(Exception e)
     {
         system.debug(e.getLineNumber()+e.getMessage());
     }
     //return false;
    }

    @AuraEnabled
    public static List<RecordsData> fetchRecords(String objectName, String filterField, String searchString, String values) {
        try {
            List<RecordsData> recordsDataList = new List<RecordsData>();
            List<String> selectedvalues = (List<String>) JSON.deserialize(values, List<String>.class);
            String query = 'SELECT Id, ' + filterField + ' FROM '+objectName;
            if(selectedvalues != null && selectedvalues.size() > 0) {
                query += ' WHERE Id IN: selectedvalues LIMIT 49999';
            } else {
                query += ' WHERE '+filterField+
                		' LIKE ' + '\'' + String.escapeSingleQuotes(searchString.trim()) + '%\' LIMIT 49999';
            }
	        for(SObject s : Database.query(query)) {
	            recordsDataList.add( new RecordsData((String)s.get(filterField), (String)s.get('id')) );
	        }
            return recordsDataList;
	    } catch (Exception err) {
	    	if ( String.isNotBlank( err.getMessage() ) && err.getMessage().contains( 'error:' ) ) {
                throw new AuraHandledException(err.getMessage().split('error:')[1].split(':')[0] + '.');
            } else {
                throw new AuraHandledException(err.getMessage());
            }
	    }
    }

    public class RecordsData {
        @AuraEnabled public String label;
        @AuraEnabled public String value;
        public RecordsData(String label, String value) {
            this.label = label;
            this.value = value;
        }
    }
}