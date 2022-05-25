public class sdc {
    public static void sdf(){
        List<Opportunity> abcd = new List<Opportunity>();
		abcd = [select id, lastmodifieddate from Opportunity limit 1];        
    }
}