public class bulkify{
    public static void Bulkyfy_map(map<id, contact> contactMap){
        try {
            String body='';
            List<contact> contactList=new List<contact>();
            for(id eachid:contactMap.KeySet()){
                contact c_obj=new contact();
                body=body+contactmap.get(eachid).lastName+' \n';
                c_obj.id=eachid;
                c_obj.lastName=contactmap.get(eachid).lastName+' '+'undeleted contact';
                contactList.add(c_obj);  
            }
            if(!contactList.isEmpty()){
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                String[] toAddresses = new String[] {userInfo.getUserEmail()};
                    mail.setToAddresses(toAddresses);
                mail.setSubject('Undelete Contact');
                mail.setPlainTextBody('These contact is undeleted \n\n'+body);
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