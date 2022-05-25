trigger TriggerContact on Contact(after insert, before insert, after update, after delete ){
   if((trigger.Isafter && trigger.IsInsert) || (trigger.Isafter && trigger.IsUpdate)){
        //CopyNameToCon.copyAccFieldToCons2(trigger.new);

    }
    
      if((trigger.Isbefore && trigger.IsInsert) || (trigger.Isbefore && trigger.IsUpdate)){
        //CopyNameToCon.preventEmail(trigger.new);
    }
}