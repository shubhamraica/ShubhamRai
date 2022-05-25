public class UnDeleteContact{
    public static void contactUndelete(List<contact> conList){
        try{
            String body='';
            List<contact> contactList=new List<contact>();
            for(Contact con:conList){
                contact c_obj=new contact();
                c_obj.id=con.id;
                c_obj.lastName=con.lastName+' '+'undeleted contact';
                contactList.add(c_obj);
                body=body+con.LastName+' \n';
            }
            if(!contactList.isEmpty()){ 
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                String[] toAddresses = new String[] {userInfo.getUserEmail()};
                    mail.setToAddresses(toAddresses);
                mail.setSubject('Contact undeleted');
                mail.setPlainTextBody('contact undeleted'+body);
                Messaging.SendEmailResult[] results = Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
            }
            if(!contactList.isEmpty()){ 
                update contactList;
            }
        }catch(Exception e){
            System.debug(e.getMessage()+' '+e.getLineNumber());
        }
    }
}