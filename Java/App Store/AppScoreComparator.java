///////////////////////////////////////////////////////////////////////////////
//                   ALL STUDENTS COMPLETE THESE SECTIONS
// Main Class File:  AppStore.java
// Files:            AppScoreComparator.java
// Semester:         (course) Fall 2015
//
// Author:           Xiaojun He	
// Email:            xhe66@wisc.edu
// CS Login:         xiaojun
// Lecturer's Name:  Jim Skrentny
///////////////////////////////////////////////////////////////////////////////
import java.util.Comparator;

/**
 * This class override the compare method in comparator for app ranking
 * 
 * @author Xiaojun He
 *
 */
public class AppScoreComparator implements Comparator<App> {
	/**
	 * override the compare method by comapring two apps' app score and time
	 * stamp
	 */
	@Override
	public int compare(App app1, App app2) {
		if (app1.getAppScore() < app2.getAppScore())
			return -1;
		else if (app1.getAppScore() == app2.getAppScore())
			// if app1 is older, counts as it has higher score
			if (app1.compareTo(app2) == 1) {
				return 1;
			} else {
				return -1;
			}
		else
			return 1;
	}

}
