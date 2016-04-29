///////////////////////////////////////////////////////////////////////////////
//                   ALL STUDENTS COMPLETE THESE SECTIONS
// Main Class File:  AppStore.java
// Files:            User.java
// Semester:         (course) Fall 2015
//
// Author:           Xiaojun He	
// Email:            xhe66@wisc.edu
// CS Login:         xiaojun
// Lecturer's Name:  Jim Skrentny
///////////////////////////////////////////////////////////////////////////////
import java.util.*;

/**
 * Stores all the information of a certain user and related apps
 * 
 * @author Xiaojun He
 *
 */
public class User {
	private String email;
	private String password;
	private String firstName;
	private String lastName;
	private String country;
	private String type;
	private List<App> dlapps = new ArrayList<App>();
	private List<App> ulapps = new ArrayList<App>();

	/**
	 * Construct a object of user
	 * 
	 * @param email
	 * @param password
	 * @param firstName
	 * @param lastName
	 * @param country
	 * @param type
	 *            developer or user
	 * @throws IllegalArgumentException
	 *             throw exception when object is not valid
	 */
	public User(String email, String password, String firstName,
			String lastName, String country, String type)
			throws IllegalArgumentException {
		if (email == null || password == null || firstName == null
				|| lastName == null || country == null
				|| !(type.equals("user") || type.equals("developer")))
			throw new IllegalArgumentException();
		this.email = email;
		this.password = password;
		this.firstName = firstName;
		this.lastName = lastName;
		this.country = country;
		this.type = type;
	}

	/**
	 * get user's email
	 * 
	 * @return email address
	 */
	public String getEmail() {
		return this.email;
	}

	/**
	 * Verify password user put in
	 * 
	 * @param testPassword
	 *            the password user input
	 * @return true if password is right, false if the password is wrong
	 */
	public boolean verifyPassword(String testPassword) {
		if (testPassword == null)
			throw new IllegalArgumentException();
		return (testPassword.equals(this.password));
	}

	/**
	 * get user's first name
	 * 
	 * @return user's first name
	 */
	public String getFirstName() {
		return this.firstName;
	}

	/**
	 * get user's last name
	 * 
	 * @return user's last name
	 */
	public String getLastName() {
		return this.lastName;
	}

	/**
	 * get user's country
	 * 
	 * @return country
	 */
	public String getCountry() {
		return this.country;
	}

	/**
	 * check if user is developer
	 * 
	 * @return true if user is developer, false if not
	 */
	public boolean isDeveloper() {
		return this.type.equals("developer");
	}

	/**
	 * promote user as developer
	 */
	public void subscribeAsDeveloper() {
		this.type = "developer";
	}

	/**
	 * add certain app to user's download list
	 * 
	 * @param app
	 */
	public void download(App app) {
		if (app == null)
			throw new IllegalArgumentException();
		dlapps.add(app);
	}

	/**
	 * add certain app to user's uploadd list
	 * 
	 * @param app
	 */
	public void upload(App app) {
		if (app == null)
			throw new IllegalArgumentException();
		ulapps.add(app);
	}

	/**
	 * get all downloaded apps of user
	 * 
	 * @return list of downloaded apps
	 */
	public List<App> getAllDownloadedApps() {
		return dlapps;
	}

	/**
	 * get all uploaded apps of user
	 * 
	 * @return list of uploaded apps
	 */
	public List<App> getAllUploadedApps() {
		return ulapps;
	}

}
