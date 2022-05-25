public class loginUserProfileCtrl {
    @AuraEnabled
    public static user fetchUserDetail(){
        User oUser = [select id,Name,SmallPhotoUrl, FullPhotoUrl,TimeZoneSidKey,Username,Alias,Country,Email,FirstName,LastName,IsActive FROM User Where id =: userInfo.getUserId()];
        return oUser;        
    }
    @AuraEnabled
    public static User EditUserInformation(User useredit)  //String FirstName, String LastName, string Email, string Username, String Country,string TimeZoneSidKey, boolean IsActive)
    {
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
}