//"Write a Script to get all the Attachment And Contacts related to an Account. If there are more than one
//Attachments and one Contacts records related to account records then except one attachementt and one Contact
// records all rest of the attachementt and Contacts will be deleted. Also copy that single attachement
//under the single contact related to that account."
public class AttachmentContact
{
    public static void attachmentRecord()
    {
        try
        {
            List<Contact> contactList = new List<Contact>();
            contactList = [SELECT ID,Name,AccountId from Contact Where AccountId != null];
            Set<Id> accountIdSet = new Set<Id>();
            for(contact contactObj : contactList){
                accountIdSet.Add(contactObj.AccountId);//accountid
            }
            List<Attachment> attlist=new List<Attachment>();
            attlist=[SELECT Id,parentid,Body,name FROM Attachment WHERE parentid IN: accountIdSet Limit 1];
            List<Attachment> copyattlist=new List<Attachment>();
            for(Contact contObj : contactList){
                for(Attachment attobj:attlist)
                {
                    Attachment at =new Attachment();
                    at.ParentId=contObj.Id;
                    at.Body=attobj.body;
                    at.Name=attobj.Name;
                    copyattlist.add(at);
                }
            }
            insert copyattlist;
        }
        catch(Exception e){
            system.debug(e.getLineNumber()+e.getMessage());
        }
    }
}