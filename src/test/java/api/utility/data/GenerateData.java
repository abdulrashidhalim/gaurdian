package api.utility.data;

public class GenerateData {
	
	
	public static String getEmail() {
		String preFix = "insturctor_email";
		String provider = "tekschoo.us";
		int random = (int) (Math.random() * 10000);
		String email = preFix + random + provider;
		return email;
		
	}
		
//	public static void main(String arg [])	{
//		
//		
//		GenerateData data = new GenerateData ();
//		
//		
//		System.out.println(data.getEmail());
//	}
		
		
		

}