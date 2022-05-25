public class Sample {
    public Decimal a {get;set;}
    public Decimal b {get;set;}
    public Decimal c {get;set;}
    
    public Sample(ApexPages.StandardController controller) {
        a = 1800.00;
        b = 200;
        c = 34567.09;
    }

}