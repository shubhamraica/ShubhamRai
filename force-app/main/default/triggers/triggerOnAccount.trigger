trigger triggerOnAccount on Account (after insert, before insert, after update, after delete ) {
    
    if(trigger.IsInsert && trigger.IsBefore){
        //SalesRepresentative.SalesRepresentativeFunc(trigger.new);
    }
    if((trigger.Isafter && trigger.IsInsert) || (trigger.Isafter && trigger.IsUpdate)){
        //CreateDefualtContact.CreateDefualtContactFunc(trigger.new);
    }
    if((trigger.Isafter && trigger.IsInsert) || (trigger.Isafter && trigger.IsUpdate)){
        //CopyNameToCon.copyAccFieldToCons(trigger.new);
    }
    if(trigger.Isafter && trigger.IsInsert){
        //CopyNameToCon.insertRltdCon(trigger.new);
    }
    if((trigger.Isafter && trigger.IsInsert) || (trigger.Isafter && trigger.IsUpdate)){
        //CopyNameToCon.updateConPhone(trigger.new);
    }
    if((trigger.Isafter && trigger.IsInsert)){
             if(StaticVarClass.firstRun){
       // CopyNameToCon.learningStaticVar();
             }
    }
    
    if(trigger.IsInsert && trigger.IsAfter){
        //CopyNameToCon.salesRepresentative(trigger.new);
    }

}