///////////////////////////////////////////////////////////////////////////////
//                   ALL STUDENTS COMPLETE THESE SECTIONS
// Main Class File:  AppStore.java
// Files:            AppStoreDB.java
// Semester:         CS367 Fall 2015
//
// Author:           Xiaojun He	
// Email:            xhe66@wisc.edu
// CS Login:         xiaojun
// Lecturer's Name:  Jim Skrentny
///////////////////////////////////////////////////////////////////////////////
import java.util.*;

/**
 * This class stores the the list of users, categories and apps in the database
 * Login user can access to the list with valid account and access the info.
 * 
 * @author Xiaojun He
 *
 */
public class AppStoreDB {

	private List<User> userList = new ArrayList<User>();
	private List<String> categoryList = new ArrayList<String>();
	private List<App> appList = new ArrayList<App>();

	/**
	 * construct a new appStore database by clearing all the list
	 */
	public AppStoreDB() {
		userList.clear();
		categoryList.clear();
		appList.clear();
	}

	/**
	 * create a new user object and adding it to the userlist
	 * 
	 * @param email
	 *            user's email
	 * @param password
	 *            user's password
	 * @param firstName
	 *            user's first name
	 * @param lastName
	 *            user's last name
	 * @param country
	 *            user's country
	 * @param type
	 *            user's type-either user or developer
	 * @return the user object
	 * @throws IllegalArgumentException
	 *             if user created in invalid or user already existed
	 */
	public User addUser(String email, String password, String firstName,
			String lastName, String country, String type)
			throws IllegalArgumentException {
		if (email == null || password == null || firstName == null
				|| lastName == null || country == null
				|| !(type.equals("user") || type.equals("developer")))
			throw new IllegalArgumentException();

		Iterator<User> itr = userList.iterator();

		while (itr.hasNext()) {
			if (itr.next().getEmail().equals(email)) {
				throw new IllegalArgumentException();
			}
		}
		User newuser = new User(email, password, firstName, lastName, country,
				type);
		userList.add(newuser);
		return newuser;
	}

	/**
	 * add category to the database
	 * 
	 * @param category
	 *            : the new category to be added
	 */
	public void addCategory(String category) {
		if (category == null)
			throw new IllegalArgumentException();
		categoryList.add(category);
	}

	/**
	 * get the list of all categories
	 * 
	 * @return list of all categories
	 */
	public List<String> getCategories() {
		return categoryList;
	}

	/**
	 * find certain user by his email
	 * 
	 * @param email
	 * @return the user if it's found, otherwise return null
	 */
	public User findUserByEmail(String email) {
		Iterator<User> itr = userList.iterator();
		while (itr.hasNext()) {
			User testuser = itr.next();
			if (testuser.getEmail().equals(email))
				return testuser;
		}
		return null;
	}

	/**
	 * find certain app by its appid
	 * 
	 * @param appId
	 * @return the app if it's found, otherwise return null
	 */
	public App findAppByAppId(String appId) {
		Iterator<App> itr = appList.iterator();
		while (itr.hasNext()) {
			App testapp = itr.next();
			if (testapp.getAppId().equals(appId))
				return testapp;
		}
		return null;
	}

	/**
	 * verify the current login status and validity of login input
	 * 
	 * @param email
	 * @param password
	 * @return the user object if the login is successful, null if failed
	 */
	public User loginUser(String email, String password) {
		User loginUser = findUserByEmail(email);
		if (loginUser == null)
			return null;
		if (loginUser.verifyPassword(password))
			return loginUser;
		else
			return null;
	}

	/**
	 * upload an app to database by providing all needed information
	 * 
	 * @param uploader
	 * @param appId
	 * @param appName
	 * @param category
	 * @param price
	 * @param timestamp
	 * @return the add being created and added
	 * @throws IllegalArgumentException
	 *             if the app is invalid or already exists
	 */
	public App uploadApp(User uploader, String appId, String appName,
			String category, double price, long timestamp)
			throws IllegalArgumentException {
		// check if it's valid app
		App newApp = new App(uploader, appId, appName, category, price,
				timestamp);
		// check if app exists already
		Iterator<App> itr = appList.iterator();
		while (itr.hasNext()) {
			if (itr.next().getAppId().equals(appId)) {
				throw new IllegalArgumentException();
			}

		}
		// add app to the database
		appList.add(newApp);
		uploader.upload(newApp);
		return newApp;
	}

	/**
	 * record the action that user downloaded an app
	 * 
	 * @param user
	 * @param app
	 */
	public void downloadApp(User user, App app) {
		user.download(app);
		app.download(user);

	}

	/**
	 * let valid user to rate certain app
	 * 
	 * @param user
	 * @param app
	 * @param rating
	 */
	public void rateApp(User user, App app, short rating) {
		if (hasUserDownloadedApp(user, app)) {
			app.rate(user, rating);
		} else {
			throw new RuntimeException("Couldn't rate since user hasn't "
					+ "downloaded this app");
		}
	}

	/**
	 * check if certain user has downloaded the app
	 * 
	 * @param user
	 * @param app
	 * @return true if user has downloaded the app, false if user hasn't
	 */
	public boolean hasUserDownloadedApp(User user, App app) {
		Iterator<App> itr = user.getAllDownloadedApps().iterator();
		while (itr.hasNext()) {
			if (itr.next() == app) {
				return true;
			}
		}
		return false;
	}

	/**
	 * get the list of free apps in certain category in ranking
	 * 
	 * @param category
	 *            user chosen specific category to be displayed
	 * @return the list of free apps in certain category in ranking
	 */
	public List<App> getTopFreeApps(String category) {
		List<App> topFreeList = new ArrayList<App>();
		Iterator<App> itr = appList.iterator();
		while (itr.hasNext()) {
			App ap = itr.next();
			if (ap.getPrice() == 0) {
				if (category == null || ap.getCategory().equals(category)) {
					topFreeList.add(ap);
				}
			}
		}
		AppScoreComparator c = new AppScoreComparator();
		Collections.sort(topFreeList, c);
		return topFreeList;
	}

	/**
	 * get the list of paid apps in certain category in ranking
	 * 
	 * @param category
	 *            user chosen specific category to be displayed
	 * @return the list of paid apps in certain category in ranking
	 */
	public List<App> getTopPaidApps(String category) {
		List<App> topPaidList = new ArrayList<App>();
		Iterator<App> itr = appList.iterator();
		while (itr.hasNext()) {
			App ap = itr.next();
			if (ap.getPrice() != 0) {
				if (category == null || ap.getCategory().equals(category)) {
					topPaidList.add(ap);
				}
			}
		}
		AppScoreComparator c = new AppScoreComparator();
		Collections.sort(topPaidList, c);
		return topPaidList;
	}

	/**
	 * get the list of certain category app in ranking
	 * 
	 * @param category
	 *            user chosen specific category to be displayed
	 * @return the list of certain category app in ranking
	 */
	public List<App> getMostRecentApps(String category) {
		List<App> recentList = new ArrayList<App>();
		Iterator<App> itr = appList.iterator();
		while (itr.hasNext()) {
			App ap = itr.next();
			if (category == null || ap.getCategory().equals(category)) {
				recentList.add(ap);
			}
		}
		Collections.sort(recentList);
		return recentList;
	}
}
