public class userDetails {
    @AuraEnabled(cacheable=true)
    public static user fetchUserDetails(){
        try {            
        User oUser = [SELECT Username, email, MobilePhone, CompanyName, SmallPhotoUrl, FullPhotoUrl FROM User WHERE id =: userInfo.getUserId()];
        system.debug('oUser : '+oUser);
        return oUser; 
        } catch (Exception y) {
            system.debug('Error in fetchUserDetails() in userDetials class '+y.getMessage()+' No of line :'+y.getLineNumber());
            return null;
        }       
    }

    @AuraEnabled
    public static User EditUserInformation(User useredit){
        try{
            system.debug(useredit);
            update useredit;
            return useredit;
        }
        catch(Exception y)
        {
            system.debug('Error'+y.getMessage()+'No of line'+y.getLineNumber());
            return null;
        }
    }
    @AuraEnabled  
    public static Id saveChunk(Id parentId, String fileName, String base64Data, String contentType, String fileId) {
        // check if fileId id ''(Always blank in first chunk), then call the saveTheFile method,
        //  which is save the check data and return the attachemnt Id after insert,
        //  next time (in else) we are call the appentTOFile() method
        //   for update the attachment with reamins chunks  
     
        try
        {
            String communityId = null;
            String userId= UserInfo.getUserId();
            system.debug('userId ::: '+userId);
            String result;
            System.debug('base64Data');
            System.debug(base64Data);
           
            base64Data = EncodingUtil.urlDecode(base64Data, 'UTF-8');
            Blob blobImages = EncodingUtil.base64Decode(base64Data);
            System.debug('blobImages-->>'+blobImages);
            if(blobImages.size() >0){
                ConnectApi.BinaryInput dataImage = new ConnectApi.BinaryInput(blobImages, 'image/jpg', 'userImage.jpg');
                ConnectApi.Photo photoProfile = ConnectApi.UserProfiles.setPhoto(communityId, userId,dataImage );
                System.debug('photoProfile-->'+photoProfile);
                return 'Uploaded';
            }
            return null;
           
        } catch (Exception ex) {
            System.debug('Exception ' + ex.getMessage() + ' AT Line Number :: ' + ex.getLineNumber() + ' Cause :: ' + ex.getCause());
            return null;
        }
    }

    @AuraEnabled
    public static void removepic(){
        try{ string userId =  userInfo.getUserId();
               ConnectApi.UserProfiles.deletePhoto(null,userId); }
       catch (Exception ex) {
            System.debug('Exception ' + ex.getMessage() + ' AT Line Number :: ' + ex.getLineNumber() + ' Cause :: ' + ex.getCause());
       }
    }

    @AuraEnabled
    public static List<Integer> fetchObjCount(){
        try {
            Integer totalAccs = Database.countQuery('select count() from account');
            Integer totalCons = Database.countQuery('select count() from contact');
            Integer totalOpps = Database.countQuery('select count() from opportunity');
            Integer totalLeads = Database.countQuery('select count() from lead');
            Integer totalContracts = Database.countQuery('select count() from contract');
            Integer totalCases = Database.countQuery('select count() from case');
            
            List<Integer> countList = new List<Integer>();
            countList.add(totalAccs);
            countList.add(totalCons);
            countList.add(totalOpps);
            countList.add(totalLeads);
            countList.add(totalContracts);
            countList.add(totalCases);

            return countList;
        } catch (Exception y) {
            system.debug('Error in fetchObjCount() in userDetials class '+y.getMessage()+' No of line :'+y.getLineNumber());
            throw new AuraHandledException(y.getMessage());
        }
    }

    @AuraEnabled
    public static void updateUser(user userDeets){
        try {
            User oUser = [SELECT Username, email, MobilePhone, CompanyName, SmallPhotoUrl, FullPhotoUrl FROM User WHERE id =: userInfo.getUserId()];
            oUser.MobilePhone = userDeets.MobilePhone;
            oUser.CompanyName = userDeets.CompanyName;
            update oUser;
        } catch (Exception y) {            
            System.debug('Error in updateUser() in userDetials class '+y.getMessage()+' No of line :'+y.getLineNumber());
            throw new AuraHandledException(y.getMessage());
        }
    }

    @AuraEnabled
    public static void removePicture(){
        try {
            string userId =  userInfo.getUserId();
            ConnectApi.UserProfiles.deletePhoto(null,userId);            
        } catch (Exception e) {
            System.debug('Error in removePicture() in userDetials class '+e.getMessage()+' No of line :'+e.getLineNumber());
            throw new AuraHandledException(e.getMessage());
        }
    }
}