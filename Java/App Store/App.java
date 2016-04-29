///////////////////////////////////////////////////////////////////////////////
//                   ALL STUDENTS COMPLETE THESE SECTIONS
// Title:            AppStore
// Files:            App.java
// Semester:         (course) Fall 2015
//
// Author:           Xiaojun He	
// Email:            xhe66@wisc.edu
// CS Login:         xiaojun
// Lecturer's Name:  Jim Skrentny
///////////////////////////////////////////////////////////////////////////////
import java.util.*;
import java.math.*;

/**
 * This class store all the information of each app in the database
 * 
 * @author Xiaojun He
 *
 */
public class App implements Comparable<App> {

	private User developer;
	private String appId;
	private String appName;
	private String category;
	private double price;
	private long uploadTimestamp;
	private int dlNum;
	private long totalrating;
	private List<User> rateduser = new ArrayList<User>();

	/**
	 * construct a new app object by passing in all his information
	 * 
	 * @param developer
	 * @param appId
	 * @param appName
	 * @param category
	 * @param price
	 * @param uploadTimestamp
	 * @throws IllegalArgumentException
	 *             if information provided isn't valid
	 */
	public App(User developer, String appId, String appName, String category,
			double price, long uploadTimestamp) throws IllegalArgumentException {
		if (developer == null || appId == null || appName == null
				|| category == null || (Double) price == null
				|| (Long) uploadTimestamp == null)
			throw new IllegalArgumentException();
		dlNum = 0;
		totalrating = 0;
		this.developer = developer;
		this.appId = appId;
		this.appName = appName;
		this.category = category;
		this.price = price;
		this.uploadTimestamp = uploadTimestamp;
	}

	/**
	 * get the developer object of this app
	 * 
	 * @return the developer of the app
	 */
	public User getDeveloper() {
		return this.developer;
	}

	/**
	 * get the apple ID of this app
	 * 
	 * @return the apple ID of this app
	 */
	public String getAppId() {
		return this.appId;
	}

	/**
	 * get the app's name
	 * 
	 * @return the app's name
	 */
	public String getAppName() {
		return this.appName;
	}

	/**
	 * get the category this app belongs to
	 * 
	 * @return the category this app belongs to
	 */
	public String getCategory() {
		return this.category;
	}

	/**
	 * get the price of the app
	 * 
	 * @return the price of the app
	 */
	public double getPrice() {
		return this.price;
	}

	/**
	 * get upload time stamp of the app
	 * 
	 * @return upload time stamp
	 */
	public long getUploadTimestamp() {
		return this.uploadTimestamp;
	}

	/**
	 * record the action that user downloaded this app and add user to
	 * downloader's list
	 * 
	 * @param user
	 */
	public void download(User user) {
		this.dlNum++;
		user.download(this);
	}

	/**
	 * allow user to rate app if user hasn't rated the app he downloaded
	 * 
	 * @param user
	 * @param rating
	 * @throws IllegalArgumentException
	 *             if user has already rated the app
	 */
	public void rate(User user, short rating) throws IllegalArgumentException {
		Iterator<User> itr = rateduser.iterator();
		while (itr.hasNext()) {
			if (itr.next() == user)
				throw new IllegalArgumentException("User already rated");
		}
		rateduser.add(user);
		totalrating += rating;
	}

	/**
	 * get totally download times
	 * 
	 * @return totally download times
	 */
	public long getTotalDownloads() {
		return this.dlNum;
	}

	/**
	 * get the average rating of the app
	 * 
	 * @return the average rating of the app
	 */
	public double getAverageRating() {
		if (dlNum == 0)
			return 0.0;
		return (double) totalrating / dlNum;
	}

	/**
	 * get the revenue of the app
	 * 
	 * @return the revenue of the app
	 */
	public double getRevenueForApp() {
		return price * dlNum;
	}

	/**
	 * get the score of the app
	 * 
	 * @return the score of the app
	 */
	public double getAppScore() {

		return this.getAverageRating() * Math.log(1 + this.dlNum);
	}

	/**
	 * override the method compareTo by comparing two apps by timpstamp
	 */
	@Override
	public int compareTo(App otherApp) {
		if (otherApp == null)
			throw new IllegalArgumentException();
		if (this.uploadTimestamp > otherApp.uploadTimestamp)
			return -1;
		else
			return 1;
	}
}
