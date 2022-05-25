public class OpportunityTriggerHandler {
    public static void preventOpp(List<Opportunity> newOppList){
        try{
            System.debug('newOppList : '+newOppList);
            set<Id> accIdSet = new set<Id>();
            for(Opportunity OpprOj : newOppList){
                accIdSet.add(OpprOj.AccountId);
            }
            List<Opportunity> oppList = new List<Opportunity>();
            oppList = [Select Id, AccountId, Amount FROM Opportunity WHERE AccountId IN : accIdSet];
            System.debug('oppList : '+oppList);
            Map<id, Decimal> mapIDvsOpp = new Map<id, Decimal>();
            
            for(Opportunity oppObj : oppList){
                if(!mapIDvsOpp.containsKey(oppObj.AccountId)){
                    mapIDvsOpp.put(oppObj.AccountId, oppObj.Amount);
                }else{
                    Decimal amnt = mapIDvsOpp.get(oppObj.AccountId);
                    amnt = amnt+oppObj.Amount;
                    mapIDvsOpp.put(oppObj.AccountId, amnt);
                }
            }
            System.debug('mapIDvsOpp without newly added opps: '+mapIDvsOpp);
            for(Opportunity oppObj : newOppList){
                if(mapIDvsOpp.containsKey(oppObj.AccountId)){
                    Decimal amnt = mapIDvsOpp.get(oppObj.AccountId);
                    amnt = amnt+oppObj.Amount;
                    mapIDvsOpp.put(oppObj.AccountId, amnt);   
                }
            }
            for(Id accId : mapIDvsOpp.keyset()){
                if(mapIDvsOpp.get(accId) >=1000){
                    newOppList[0].addError('You cannot add this opportunity as the sum of amount of all opportunity on this account is more than 1000');
                }
            }
            System.debug('mapIDvsOpp with all added opps: '+mapIDvsOpp);
        }catch(Exception e){
            System.debug('Error at line '+e.getLineNumber()+'. '+e.getMessage());
        }
    }
    public static void addDiscount(List<Opportunity> newOppList){
        try{
            for(Opportunity eachOpp : newOppList){
                eachOpp.Amount = eachOpp.Amount - eachOpp.Amount * (0.1);
            }
            upsert newOppList;
        }catch(Exception e){
            System.debug('Error at line number '+e.getLineNumber()+'. '+e.getMessage());
        }
    }
    public static void AccountVerification(List<Account> account3){
        USER u=[SELECT Id,Name,username,Alias FROM User WHERE Name='barak obama'];
        for(Account acc:account3){
            if(acc.Status__c=='Verification Needed'){
                acc.OwnerId=u.Id;
            }
        }
    }
    public static void REIError(List<Account> account3){
        for(Account acc:account3)
        {
            string testName='REI';
            if(acc.Name.Contains(testName))
            {
                acc.addError('The Account Name Should Not contain REI Text Value.');
            }
            else
            {
                if(acc.Name.Contains('__Test')){
                    //do nothing
                }
                else{
                    acc.name=acc.name+'__Test';
                }
            }
        }
    }
    
    
    public static void AccountMethod(List<Opportunity> opplist){
        set<Id> AccountIdset = new set<id>();
        for(opportunity each : opplist){
            AccountIdset.add(each.AccountId);
        }
        List<Account> accountList = new List<Account>();
        accountList = [select Id ,(select Id,stageName,AccountId from Opportunities) from Account where Id in: AccountIdset];
        
        Map<Id, List<Opportunity>> AccountIdOpportunityMap = new Map<Id, List<Opportunity>>();
        
        for ( Account each : [select Id ,(select Id,stageName,AccountId from Opportunities) from Account where Id in: AccountIdset]) {
            for (Opportunity opp : each.Opportunities) {
                if(AccountIdOpportunityMap.containsKey(each.Id)){
                    AccountIdOpportunityMap.get(each.Id).add(opp);
                }else {
                    AccountIdOpportunityMap.put(each.Id, new opportunity[]{opp});
                }
            }
        }
        
        for(Opportunity opp : opplist){
            for(Account eachAccount : accountList){
                for(Opportunity each : eachAccount.Opportunities){
                    if(opp.Stagename == each.Stagename){
                        opp.StageName.addError('Duplicate stage Name');
                    }
                }
            }
        }
        
        
        for(Account eachAccount : accountList){
            for(Opportunity each : eachAccount.Opportunities){
                
            }
        }
    }
    
    
    
    
    
    
    public static void AccountMethod(){
        //Id of Quote record.
        String QuoteID = '0Q05g0000009IbXCAU';
        
        //Id of quote Template
        String templateID = '0EH5g000007MaGD';
        
        //This Url create the pdf for quote
        String quoteUrl = '/quote/quoteTemplateDataViewer.apexp?id=';
        
        quoteUrl +=QuoteID;
        
        quoteUrl +='&headerHeight=190&footerHeight=188&summlid=';
        
        quoteUrl +=templateID ;
        
        quoteUrl +='#toolbar=1&navpanes=0&zoom=90';
        
        //Create pdf content
        PageReference pg = new PageReference(quoteUrl) ;
        
        //Document object of quote which hold the quote pdf
        QuoteDocument quotedoc = new QuoteDocument();
        
        //Get the content of Pdf.
        Blob b = pg.getContentAsPDF() ;
        
        //content assign to document
        quotedoc.Document = b;
        
        //assign quote id where pdf should attach
        quotedoc.QuoteId = QuoteID ;
        
        //insert the quotdoc
        insert quotedoc; 
        
        
        sendQuoteASmail(quotedoc.id, QuoteID);

      
    }
    
    
    public static void sendQuoteASmail(String quotedocId , string quoteId){
          
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        // Create the email attachment    
        Messaging.EmailFileAttachment efa = new Messaging.EmailFileAttachment();
        efa.setFileName('some file name');
        List<ContentDocumentLink> cdlList = [SELECT ContentDocumentId FROM ContentDocumentLink WHERE LinkedEntityId = '0Q05g0000009IbXCAU'];
        List<ContentVersion> cvList = [SELECT VersionData, FileExtension FROM ContentVersion WHERE ContentDocumentId ='0695g000004efkuAAA' AND IsLatest = true limit 1];
        Blob fileData = cvList[0].VersionData; // <= This step converts the version data into a blob for the attachment
        Messaging.EmailFileAttachment emlAtt = new Messaging.EmailFileAttachment();
        emlAtt.setFilename('MyFi');
        emlAtt.setBody(fileData);
		system.debug('fileData : '+fileData);
      
        // Set the paramaters to the email object
        email.setSubject( 'some subject ' );
        
        // Here I am accessing current user email id to whom we are sending email
        List<string> sdc = new List<String>();
        sdc.add('yoyogodg@gmail.com');
        sdc.add('shubham.rai@cloudanalogy.com');
        email.setToAddresses( sdc);
        email.setPlainTextBody( 'plain body' );
        
        // Attach file using setFileAttachments function
        //email.setFileAttachments(new Messaging.EmailFileAttachment[] {emlAtt});
        // Sends the email
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { email });
    
   
    }
    
    
    
    
}