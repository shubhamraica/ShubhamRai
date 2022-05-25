public class Average_Rating {
    public static void calculateRating()
    {
        try{ 
            Integer rating = 0,Count = 0,avg = 0;
            List<Contact> contact_list = new List<Contact>();
            contact_list = [Select id, Name from Contact];//contacts
            Set<Id> contactId = new Set<Id>();
            for(contact con : contact_list){
                contactId.add(con.id);
            }
            system.debug('contactid'+contactId);    
            
            List<Maintenance__c> Maintenance_List = new List<Maintenance__c>();
            Maintenance_List = [Select id,name,Contact__c,RatingPickList__c from Maintenance__c where Contact__r.id in:contactId];//all maintenace record
            system.debug('maintenance id'+Maintenance_List);
            list<contact>contactlist=new list<contact>(); 
            for(Contact con_obj : contact_list){
                for(Maintenance__c main_obj : Maintenance_List){ 
                    if(con_obj.Id == main_obj.Contact__c ){
                        rating = rating + Integer.ValueOf(main_obj.RatingPickList__c);//calculate rating
                        Count++;//count
                        avg = rating/Count;//average
                        con_obj.Average_rating__c = avg;
                        contactlist.add(con_obj);
                    }
                    
                }
            }
            update contact_list; 
            system.debug(contact_list);
        }
        catch(Exception e)
        {
            system.debug(e.getLineNumber()+e.getMessage());
        }
    }
}