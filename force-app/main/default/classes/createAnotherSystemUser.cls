public class createAnotherSystemUser {
    public static void CreateAdmin(){
        try{
            Profile proID=new Profile();
            proID=[SELECT id FROM Profile WHERE Name='System Administrator' LIMIT 1 ];
            User newUser=new User();
            newUser.Alias='SECOND User';
            newUser.LastName='Last user name';
            newUser.Email='shubham.rai0196@gmail.com';
            newUser.Username='shubhamrai0196@gmail.com';
            newUser.UserRoleId='Developer';
            newUser.ProfileId = proID.id;
            insert newUser;
        }catch (Exception e){
            System.debug('ERROR AT LINE '+e.getLineNumber()+'\n'+' '+e.getMessage());
        }
    }
}