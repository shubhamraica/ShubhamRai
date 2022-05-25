public class SendMailWhenContactInserted {
    public static void SendMailWhenContactInsertedFunc(list<Contact> contactList){
        try{
            Set<id> Ownid = new Set<Id>();
            for(Contact c : contactList){
                ownid.add(c.Ownerid);
            }
            List<user> userList = new List<User>();
            userlist=[select id,email from user where id IN : ownId limit 100];
            for(Contact c : contactList){
                for(User u : userList){
                    Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
                    message.toAddresses = new String[] { c.email , u.email };
                        message.optOutPolicy = 'FILTER';
                    message.subject = 'Alert ['+c.FirstName+' '+c.Lastname+']';
                    message.plainTextBody = 'A new contact is inserted in salesforce name '+c.FirstName+' '+c.Lastname+' of the contact '+c.MobilePhone;
                    Messaging.SingleEmailMessage[] messages = new List<Messaging.SingleEmailMessage> {message};
                        Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
                    if (results[0].success) {
                        System.debug('Sent successfully.');
                    } else {
                        System.debug('Failed : : ' + results[0].errors[0].message);
                    }
                }
            }
        }catch(Exception e){
            System.debug('Error at line '+e.getLineNumber()+'. '+e.getMessage());
        } 
    }
}