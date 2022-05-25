public class opportunityWonLoss {
    public static void searchAccountAndId(){
        try{
            List<OpportunityContactRole> contactRoleList=new List<OpportunityContactRole>();
            contactRoleList=[Select Contact.AccountId, Opportunity.AccountId,Opportunity.Name 
                            From OpportunityContactRole where opportunity.StageName LIKE '%Closed%'];
            if(contactRoleList.isEmpty()){
                for(OpportunityContactRole opp:contactRoleList){
                    if(opp.Contact.AccountId==opp.Opportunity.AccountId)
                        System.debug(opp.Opportunity.Name);
                }
            }
        }catch (Exception e){
            System.debug('ERROR AT LINE '+e.getLineNumber()+'\n'+' '+e.getMessage());
        }
    }
    
    
    
    
    
    public static void changeCodetoNames(){
        List<Contact> conList = [SELECT Short_Forms__c FROM Contact ORDER BY CreatedDate LIMIT 50000];
        List<String> shortList = new List<String>();
        for(Contact each : conList){
            if(each.Short_Forms__c != NULL){
                List<String> separatedList = each.Short_Forms__c.split(',');
                for(Integer i = 0; i<separatedList.Size(); i++){
                    if(separatedList[i] == 'SOB'){
                    separatedList[i] = 'Beverley';
                }else if(separatedList[i] == 'BBS'){
                    separatedList[i].replace('BBS', 'Beverley Beckside');
                }else if(separatedList[i] == 'BVC'){
                    separatedList[i].replace('BVC', 'Beverley Central');
                }else if(separatedList[i] == 'MOL'){
                    separatedList[i].replace('MOL', 'Beverley Molescroft');
                }else if(separatedList[i] == 'SBE'){
                    separatedList[i].replace('SBE', 'Beverley South');
                }else if(separatedList[i] == 'CHE'){
                    separatedList[i].replace('CHE', 'Cherry Burton & Bishop Burton');
                }else if(separatedList[i] == 'DRI'){
                    separatedList[i].replace('DRI', 'Driffield and Villages');
                }else if(separatedList[i] == 'EAB'){
                    separatedList[i].replace('EAB', 'East Beverley');
                }else if(separatedList[i] == 'HOR'){
                    separatedList[i].replace('HOR', 'Hornsea and Villages');
                }else if(separatedList[i] == 'LEC'){
                    separatedList[i].replace('LEC', 'Leconfield');
                }else if(separatedList[i] == 'LEV'){
                    separatedList[i].replace('LEV', 'Leven, Brandesburton');
                }else if(separatedList[i] == 'LON'){
                    separatedList[i].replace('LON', 'Long Riston, Skirlaugh');
                }else if(separatedList[i] == 'LUN'){
                    separatedList[i].replace('LUN', 'Lund and Villages');
                }else if(separatedList[i] == 'MAR'){
                    separatedList[i].replace('MAR', 'Market Wighton, Pocklington');
                }else if(separatedList[i] == 'TIC'){
                    separatedList[i].replace('TIC', 'Tickton, Wheel');
                }else if(separatedList[i] == 'WAL'){
                    separatedList[i].replace('WAL', 'Walkington');
                }else if(separatedList[i] == 'WOO'){
                    separatedList[i].replace('WOO', 'Woodmansey, Dunswell');
                }else if(separatedList[i] == 'BRH'){
                    separatedList[i].replace('BRH', 'Bransholme, Castle Grange');
                }else if(separatedList[i] == 'EAC'){
                    separatedList[i].replace('EAC', 'East Council Estate');
                }else if(separatedList[i] == 'ING'){
                    separatedList[i].replace('ING', 'Garden Village');
                }else if(separatedList[i] == 'HHR'){
                    separatedList[i].replace('HHR', 'Holderness High Road');
                }else if(separatedList[i] == 'HOD'){
                    separatedList[i].replace('HOD', 'Holderness Road');
                }else if(separatedList[i] == 'INR'){
                    separatedList[i].replace('INR', 'Ings Road');
                }else if(separatedList[i] == 'KIN'){
                    separatedList[i].replace('KIN', 'Kingswood');
                }else if(separatedList[i] == 'MAL'){
                    separatedList[i].replace('MAL', 'Malet Lambert');
                }else if(separatedList[i] == 'MAF'){
                    separatedList[i].replace('MAF', 'Marfleet Area');
                }else if(separatedList[i] == 'SAR'){
                    separatedList[i].replace('SAR', 'Salthouse Area');
                }else if(separatedList[i] == 'STO'){
                    separatedList[i].replace('STO', 'Stoneferry Road');
                }else if(separatedList[i] == 'SUT'){
                    separatedList[i].replace('SUT', 'Sutton Park');
                }else if(separatedList[i] == 'SUO'){
                    separatedList[i].replace('SUO', 'Sutton Village');
                }else if(separatedList[i] == 'VIC'){
                    separatedList[i].replace('VIC', 'Victoria Dock');
                }else if(separatedList[i] == 'WAW'){
                    separatedList[i].replace('WAW', 'Wawne');
                }else if(separatedList[i] == 'BIL'){
                    separatedList[i].replace('BIL', 'Bilton, Sproatley');
                }else if(separatedList[i] == 'BUR'){
                    separatedList[i].replace('BUR', 'Burton Pidsea & Roos');
                }else if(separatedList[i] == 'EAS'){
                    separatedList[i].replace('EAS', 'Easington, Holmpton');
                }else if(separatedList[i] == 'GAN'){
                    separatedList[i].replace('GAN', 'Ganstead, Coinston');
                }else if(separatedList[i] == 'HED'){
                    separatedList[i].replace('HED', 'Hedon');
                }else if(separatedList[i] == 'KEI'){
                    separatedList[i].replace('KEI', 'Keyingham, Ottringham, Halsham');
                }else if(separatedList[i] == 'OLD'){
                    separatedList[i].replace('OLD', 'Old Ellerby, New Ellerby');
                }else if(separatedList[i] == 'PAT'){
                    separatedList[i].replace('PAT', 'Patrington, Winestead');
                }else if(separatedList[i] == 'PAL'){
                    separatedList[i].replace('PAL', 'Paulll, Thorngumbald, Burtswick');
                }else if(separatedList[i] == 'SAT'){
                    separatedList[i].replace('SAT', 'Salt End, Preston');
                }else if(separatedList[i] == 'SUN'){
                    separatedList[i].replace('SUN', 'Sunk Island');
                }else if(separatedList[i] == 'WEC'){
                    separatedList[i].replace('WEC', 'Welwick, Skeffling');
                }else if(separatedList[i] == 'WIT'){
                    separatedList[i].replace('WIT', 'Withernsea');
                }else if(separatedList[i] == 'WYN'){
                    separatedList[i].replace('WYN', 'Wyton, Aldbrough');
                }  
                }                    
            }
        }  
        update conList;        
    }
    
    
    
    
    
}