///////////////////////////////////////////////////////////////////////////////
//                   ALL STUDENTS COMPLETE THESE SECTIONS
// Title:            AppStore
// Files:            AppStore.java
// Semester:         (course) Fall 2015
//
// Author:           Xiaojun He	
// Email:            xhe66@wisc.edu
// CS Login:         xiaojun
// Lecturer's Name:  Jim Skrentny
///////////////////////////////////////////////////////////////////////////////
import java.time.Instant;
import java.util.*;
import java.io.File;
import java.io.FileNotFoundException;

/**
 * This is the class contains main method, implementing all the command
 * processing and file reading function.
 * 
 * @author Xiaojun He
 *
 */
public class AppStore {
	// construct a new appstore database
	private static AppStoreDB appStoreDB = new AppStoreDB();
	private static User appUser = null;
	private static Scanner scanner = null;

	/**
	 * main method implement the appstore user interface and initialize the
	 * application
	 * 
	 * @param args
	 */
	public static void main(String args[]) {
		if (args.length < 4) {
			System.err.println("Bad invocation! Correct usage: "
					+ "java AppStore <UserDataFile> <CategoryListFile> "
					+ "<AppDataFile> <AppActivityFile>");
			System.exit(1);
		}

		boolean didInitialize = initializeFromInputFiles(args[0], args[1],
				args[2], args[3]);

		if (!didInitialize) {
			System.err.println("Failed to initialize the application!");
			System.exit(1);
		}

		System.out.println("Welcome to the App Store!\n"
				+ "Start by browsing the top free and the top paid apps "
				+ "today on the App Store.\n"
				+ "Login to download or upload your favorite apps.\n");

		processUserCommands();
	}

	/**
	 * initialize the database from files, return true if success, otherwise
	 * exit the program
	 * 
	 * @param userDataFile
	 * @param categoryListFile
	 * @param appDataFile
	 * @param appActivityFile
	 * @return true if success, otherwise exit the program
	 */
	private static boolean initializeFromInputFiles(String userDataFile,
			String categoryListFile, String appDataFile, String appActivityFile) {

		try {
			File userData = new File(userDataFile);
			File categoryList = new File(categoryListFile);
			File appData = new File(appDataFile);
			File appActivity = new File(appActivityFile);
			readUser(userData, appStoreDB);
			readCategory(categoryList, appStoreDB);
			readAppDatas(appData, appStoreDB);
			readAppActivitys(appActivity, appStoreDB);
		} catch (FileNotFoundException e) {
			System.out.println(e);
			System.out.println("File <Filename> not found");
			System.exit(1);
		}
		return true;
	}

	/**
	 * read user file and create new user object with the information given
	 * 
	 * @param userData
	 *            : file containing data of users
	 * @param asDB
	 *            : the current database object
	 * @throws FileNotFoundException
	 *             if the file doesn't exist in directory
	 */
	private static void readUser(File userData, AppStoreDB asDB)
			throws FileNotFoundException {
		scanner = new Scanner(userData).useDelimiter(",|\n");
		while (scanner.hasNext()) {
			asDB.addUser(scanner.next(), scanner.next(), scanner.next(),
					scanner.next(), scanner.next(), scanner.next());
		}

	}

	/**
	 * read category file and create the category list in the databsse
	 * 
	 * @param categoryList
	 *            : file containing adding categories
	 * @param asDB
	 *            : the current database object
	 * @throws FileNotFoundException
	 *             if the file doesn't exist in directory 
	 */
	private static void readCategory(File categoryList, AppStoreDB asDB)
			throws FileNotFoundException {
		scanner = new Scanner(categoryList).useDelimiter(",|\n");
		while (scanner.hasNext()) {
			asDB.addCategory(scanner.next());
		}

	}

	/**
	 * read appData file and store the corresponding information in to database
	 * 
	 * 
	 * @param appData
	 *            : file containing all apps' information
	 * @param asDB
	 *            : the current database object
	 * @throws FileNotFoundException
	 *             if the file doesn't exist in directory 
	 */
	private static void readAppDatas(File appData, AppStoreDB asDB)
			throws FileNotFoundException {
		scanner = new Scanner(appData).useDelimiter(",|\n");
		while (scanner.hasNext()) {
			// potential problem: what if developer isn't in the database yet
			User upUser = asDB.findUserByEmail(scanner.next());
			asDB.uploadApp(upUser, scanner.next(), scanner.next(),
					scanner.next(), scanner.nextDouble(), scanner.nextLong());

		}

	}

	/**
	 * read appActivity file and record related downloading and rating
	 * information in to databse
	 * 
	 * @param appActivity
	 *            : file containing related app activities
	 * @param asDB
	 *            : the current database object
	 * @throws FileNotFoundException
	 *             if the file doesn't exist in directory
	 * 
	 */
	private static void readAppActivitys(File appActivity, AppStoreDB asDB)
			throws FileNotFoundException {
		scanner = new Scanner(appActivity).useDelimiter(",|\n");
		while (scanner.hasNext()) {
			if (scanner.next().equals("d")) {
				String userEmail = scanner.next();
				String appid = scanner.next();
				asDB.findAppByAppId(appid).download(
						asDB.findUserByEmail(userEmail));
			} else {
				String userEmail = scanner.next();
				String appid = scanner.next();
				short rating = scanner.nextShort();
				asDB.rateApp(asDB.findUserByEmail(userEmail),
						asDB.findAppByAppId(appid), rating);
			}
		}
	}

	private static void processUserCommands() {
		scanner = new Scanner(System.in);
		String command = null;
		do {
			if (appUser == null) {
				System.out.print("[anonymous@AppStore]$ ");
			} else {
				System.out.print("[" + appUser.getEmail().toLowerCase()
						+ "@AppStore]$ ");
			}
			command = scanner.next();
			switch (command.toLowerCase()) {
			case "l":
				processLoginCommand();
				break;

			case "x":
				processLogoutCommand();
				break;

			case "s":
				processSubscribeCommand();
				break;

			case "v":
				processViewCommand();
				break;

			case "d":
				processDownloadCommand();
				break;

			case "r":
				processRateCommand();
				break;

			case "u":
				processUploadCommand();
				break;

			case "p":
				processProfileViewCommand();
				break;

			case "q":
				System.out.println("Quit");
				break;
			default:
				System.out.println("Unrecognized Command!");
				break;
			}
		} while (!command.equalsIgnoreCase("q"));
		scanner.close();
	}

	private static void processLoginCommand() {
		if (appUser != null) {
			System.out.println("You are already logged in!");
		} else {
			String email = scanner.next();
			String password = scanner.next();
			appUser = appStoreDB.loginUser(email, password);
			if (appUser == null) {
				System.out.println("Wrong username / password");
			}
		}
	}

	private static void processLogoutCommand() {
		if (appUser == null) {
			System.out.println("You are already logged out!");
		} else {
			appUser = null;
			System.out.println("You have been logged out.");
		}
	}

	private static void processSubscribeCommand() {
		if (appUser == null) {
			System.out.println("You need to log in "
					+ "to perform this action!");
		} else {
			if (appUser.isDeveloper()) {
				System.out.println("You are already a developer!");
			} else {
				appUser.subscribeAsDeveloper();
				System.out.println("You have been promoted as developer");
			}
		}
	}

	private static void processViewCommand() {
		String restOfLine = scanner.nextLine();
		Scanner in = new Scanner(restOfLine);
		String subCommand = in.next();
		int count;
		String category;
		switch (subCommand.toLowerCase()) {
		case "categories":
			System.out.println("Displaying list of categories...");
			List<String> categories = appStoreDB.getCategories();
			count = 1;
			for (String categoryName : categories) {
				System.out.println(count++ + ". " + categoryName);
			}
			break;
		case "recent":
			category = null;
			if (in.hasNext()) {
				category = in.next();
			}
			displayAppList(appStoreDB.getMostRecentApps(category));
			break;
		case "free":
			category = null;
			if (in.hasNext()) {
				category = in.next();
			}
			displayAppList(appStoreDB.getTopFreeApps(category));
			break;
		case "paid":
			category = null;
			if (in.hasNext()) {
				category = in.next();
			}
			displayAppList(appStoreDB.getTopPaidApps(category));
			break;
		case "app":
			String appId = in.next();
			App app = appStoreDB.findAppByAppId(appId);
			if (app == null) {
				System.out.println("No such app found with the given app id!");
			} else {
				displayAppDetails(app);
			}
			break;
		default:
			System.out.println("Unrecognized Command!");
		}
		in.close();
	}

	private static void processDownloadCommand() {
		if (appUser == null) {
			System.out.println("You need to log in "
					+ "to perform this action!");
		} else {
			String appId = scanner.next();
			App app = appStoreDB.findAppByAppId(appId);
			if (app == null) {
				System.out.println("No such app with the given id exists. "
						+ "Download command failed!");
			} else {
				try {
					appStoreDB.downloadApp(appUser, app);
					System.out.println("Downloaded App " + app.getAppName());
				} catch (Exception e) {
					System.out.println("Something went wrong. "
							+ "Download command failed!");
				}
			}
		}

	}

	private static void processRateCommand() {
		if (appUser == null) {
			System.out.println("You need to log in "
					+ "to perform this action!");
		} else {
			String appId = scanner.next();
			App app = appStoreDB.findAppByAppId(appId);
			if (app == null) {
				System.out.println("No such app with the given id exists. "
						+ "Rating command failed!");
			} else {
				try {
					short rating = scanner.nextShort();
					appStoreDB.rateApp(appUser, app, rating);
					System.out.println("Rated app " + app.getAppName());
				} catch (Exception e) {
					System.out.println("Something went wrong. "
							+ "Rating command failed!");
				}
			}
		}

	}

	private static void processUploadCommand() {
		if (appUser == null) {
			System.out.println("You need to log in "
					+ "to perform this action!");
		} else {
			String appName = scanner.next();
			String appId = scanner.next();
			String category = scanner.next();
			double price = scanner.nextDouble();
			long uploadTimestamp = Instant.now().toEpochMilli();
			try {
				appStoreDB.uploadApp(appUser, appId, appName, category, price,
						uploadTimestamp);
			} catch (Exception e) {
				System.out.println("Something went wrong. "
						+ "Upload command failed!");
			}
		}
	}

	private static void processProfileViewCommand() {
		String restOfLine = scanner.nextLine();
		Scanner in = new Scanner(restOfLine);
		String email = null;
		if (in.hasNext()) {
			email = in.next();
		}
		if (email != null) {
			displayUserDetails(appStoreDB.findUserByEmail(email));
		} else {
			displayUserDetails(appUser);
		}
		in.close();

	}

	private static void displayAppList(List<App> apps) {
		if (apps.size() == 0) {
			System.out.println("No apps to display!");
		} else {
			int count = 1;
			for (App app : apps) {
				System.out.println(count++ + ". " + "App: " + app.getAppName()
						+ "\t" + "Id: " + app.getAppId() + "\t" + "Developer: "
						+ app.getDeveloper().getEmail());
			}
		}
	}

	private static void displayAppDetails(App app) {
		if (app == null) {
			System.out.println("App not found!");
		} else {
			System.out.println("App name: " + app.getAppName());
			System.out.println("App id: " + app.getAppId());
			System.out.println("Category: " + app.getCategory());
			System.out.println("Developer Name: "
					+ app.getDeveloper().getFirstName() + " "
					+ app.getDeveloper().getLastName());
			System.out.println("Developer Email: "
					+ app.getDeveloper().getEmail());
			System.out.println("Total downloads: " + app.getTotalDownloads());
			System.out.println("Average Rating: " + app.getAverageRating());

			// show revenue from app if the logged-in user is the app developer
			if (appUser != null
					&& appUser.getEmail().equalsIgnoreCase(
							app.getDeveloper().getEmail())) {
				System.out.println("Your Revenue from this app: $"
						+ app.getRevenueForApp());
			}

		}
	}

	private static void displayUserDetails(User user) {
		if (user == null) {
			System.out.println("User not found!");
		} else {
			System.out.println("User name: " + user.getFirstName() + " "
					+ user.getLastName());
			System.out.println("User email: " + user.getEmail());
			System.out.println("User country: " + user.getCountry());

			// print the list of downloaded apps
			System.out.println("List of downloaded apps: ");
			List<App> downloadedApps = user.getAllDownloadedApps();
			displayAppList(downloadedApps);

			// print the list of uploaded app
			System.out.println("List of uploaded apps: ");
			List<App> uploadedApps = user.getAllUploadedApps();
			displayAppList(uploadedApps);

			// show the revenue earned, if current user is developer
			if (appUser != null
					&& user.getEmail().equalsIgnoreCase(appUser.getEmail())
					&& appUser.isDeveloper()) {
				double totalRevenue = 0.0;
				for (App app : uploadedApps) {
					totalRevenue += app.getRevenueForApp();
				}
				System.out.println("Your total earnings: $" + totalRevenue);
			}

		}
	}
}
