import java.security.Timestamp;
import java.sql.Time;
import java.text.DateFormat;
import java.text.Format;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class test {

	public static void main(String[] args) throws ParseException {
		
//		  // TODO Auto-generated method stub 
//		  String a = "12/20/2015,12:00"; //
//		  //Time t = Time.valueOf("12/20/2015"); 
//		  // DateFormat userDateFormat = new SimpleDateFormat("yyyy-MM-dd 
//		  // HH:mm:SS");
//		  DateFormat userDate = new SimpleDateFormat("MM/dd/yyyy,HH:mm"); 
//		  Date date = userDate.parse(a); 
//		  // String finaldate =dateFormatNeeded.format(date);
//		  
//		 long l = date.getTime(); 
//		 System.out.println(l);
//		 String m =userDate.format(l);
//		 System.out.println(m);
		 
		SortedListADT<Event> events = new IntervalBST<Event>();
		// for (int i = 0; i < 10; i++) {
		// events.insert(new Event(i, i + 1, "a", "a", "a", "a"));
		// //System.out.println(events.lookup(new Event(i, i + 1, "a", "a", "a",
		// "a")).toString());
		// }
		// Event n=new Event(5, 6, "a", "a", "a", "a");
//		 System.out.println(events.lookup(n).toString());
		//events.insert(new Tvent(1, 3));
		//events.insert(new Tvent(5, 7));
		
		Event a=new Event(1, 2, "a", "a", "a", "a");
		events.insert(a);
		Event b=new Event(2, 3, "b", "b", "b", "b");
		events.insert(b);
		Event c=new Event(1, 2, "b", "b", "b", "b");
		events.delete(c);
		//System.out.println(c.equals(a));
		//System.out.println(events.lookup(b));
		//System.out.println(a.equals(b));
		//System.out.println(Math.max(5, null));

	}

}
