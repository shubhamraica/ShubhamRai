trigger triggerOnProduct on Product2 (after insert) {
    if(trigger.isInsert){
        if(trigger.isAfter){
            //setupDefualtPriceBook.setupDefualtPriceBookFunc(trigger.new);
        }
    }	
}