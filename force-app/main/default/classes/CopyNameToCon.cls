public class CopyNameToCon {
    public static void copyAccFieldToCons(List<Account> newAccList){
        try{
            set<Id> accIdSet = new set<Id>();
            for(Account accObj : newAccList){
                if(accObj.checkBoxOnAccount__c == true){
                    accIdSet.add(accObj.Id);
                }
            }
            System.debug('accIdSet : '+accIdSet);
            List<Contact> reltdConList = [SELECT id, AccountId, Name, ConOrgName__c FROM Contact WHERE AccountId IN : accIdSet];
            for(Contact conObj : reltdConList){
                for(Account accobj:newAccList){
                    conObj.ConOrgName__c = accobj.orgName__c;
                }
            }    
            update reltdConList;
        }catch(Exception e){
            System.debug('Error at line '+e.getLineNumber()+'. '+e.getMessage());
        }
    }
    
   /*ublic static void copyAccFieldToCons2(List<Contact> newConList){
        try{
            set<Id> accIdSet = new set<Id>();
            for(Contact conObj : newConList){
                if(conObj.AccountId != NULL){
                    accIdSet.add(conObj.AccountId);
                }
            }                        
            List<Contact> conList = [SELECT id, ConOrgName__c FROM Contact Where AccountId IN : accIdSet];
            List<Account> accList = [SELECT id, OrgName__c FROM Account WHERE id IN :accIdSet AND checkBoxOnAccount__c = TRUE];
            for(Account accObj : accList){
                for(Contact conObj : conList){
                    conObj.ConOrgName__c = accObj.orgName__c;
                }  
            }
        }catch(Exception e){
            System.debug('Error at line '+e.getLineNumber()+'. '+e.getMessage());
        }
    }*/
    
    
    
    
    
    
    
    public static void preventEmail(List<Contact> newConList){
        if(newConList.size() >0){
            List<Contact> conList = [SELECT Email FROM Contact LIMIT 50000];
            for(Contact eachCon : conList){
                for(Contact newEachCon : newConList){
                    if(eachCon.Email == newEachCon.Email){
                        newEachCon.addError('You can not insert duplicate email.');
                    }
                }
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    public static void insertRltdCon(List<Account> newAccList){
        if(newAccList.size() >0){
            Set<Id> accIdSet = new Set<Id>();
            for(Account eachAcc : newAccList){
                accIdSet.add(eachAcc.Id);
            }
            List<Contact> toInsertConList = new List<Contact>();
            for(Id eachAccId : accIdSet){
                for(Integer i = 1; i<= 2; i++){
                    Contact conObj = new Contact();
                    conObj.LastName = 'oooooooooooooo';
                    conObj.AccountId = eachAccId;
                    toInsertConList.add(conObj);
                }
            }            
            insert toInsertConList;
            System.debug('toInsertConList in last : '+toInsertConList);
        }
    }
    
    
    public static void updateConPhone(List<Account> newAccList){
        if(newAccList.size() >0){
            Set<Id> accIdSet = new Set<Id>();
            for(Account eachAcc : newAccList){
                accIdSet.add(eachAcc.Id);
            }
            List<Contact> newConList = new List<Contact>();
            List<Contact> conList = [SELECT Id, Phone FROM Contact WHERE AccountId IN:accIdSet];           
            for(Contact eachCon : conList){                    
                for(Account eachAcc : newAccList){
                    eachCon.Phone = eachAcc.Phone;                        
                }        
                newConList.add(eachCon);
            }            
            update newConList;            
        }
    }
    
    
    


    
        public static void learningStaticVar(){
            try{
               StaticVarClass.firstRun = false;
                Account accObj = new Account();
                accObj.Name	= ' from trigger after insert';
                insert accObj;
                
            
            }catch(Exception e){
            System.debug('Error at line '+e.getLineNumber()+'. '+e.getMessage());
        }
     }

    
    
     public static void salesRepresentative(List<Account> AccList){
         System.debug('trigger.new +>>' +trigger.new);
        try{
            AccList=[SELECT Id,Name From Account where Id In:trigger.new];
            if(AccList.size()>0){
            for(Account EachAcc:AccList){
                EachAcc.Name=UserInfo.getName();
            }
           }
           if(AccList.size()>0){
            update AccList;
          }
        }
        catch(Exception e){
            System.debug('Error is: '+e.getMessage()+' In line number:'+e.getLineNumber());
        }
    }   

    
    
    
    
}