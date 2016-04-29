///////////////////////////////////////////////////////////////////////////////
//                   ALL STUDENTS COMPLETE THESE SECTIONS
// Main Class File:  AppStore.java
// Files:            AppRating.java
// Semester:         (course) Fall 2015
//
// Author:           Xiaojun He	
// Email:            xhe66@wisc.edu
// CS Login:         xiaojun
// Lecturer's Name:  Jim Skrentny
///////////////////////////////////////////////////////////////////////////////
/**
 * This class store the rating of a certain app.
 * 
 * @author Xiaojun He
 *
 */
public class AppRating {
	private App app;
	private User user;
	private short rating;

	/**
	 * consturct a AppRating object
	 * 
	 * @param app
	 * @param user
	 * @param rating
	 */
	public AppRating(App app, User user, short rating) {
		this.app = app;
		this.user = user;
		this.rating = rating;
	}

	public App getApp() {
		return this.app;
	}
	public User getUser() {
		return this.user;
	}

	public short getRating() {
		return this.rating;
	}
}
