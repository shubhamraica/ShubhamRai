trigger TriggerOnOli on OpportunityLineItem (after insert) 
{
    if(Trigger.isInsert)
    {
        if(Trigger.isAfter)
        {
            //opportunityLineItem_handler.countOli(Trigger.newMap);
        }
    }

}