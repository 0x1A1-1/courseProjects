///////////////////////////////////////////////////////////////////////////////
//                   ALL STUDENTS COMPLETE THESE SECTIONS
// Title:            TheGame
// Files:            DirectedGraph.java, Player.java, Item.java, Room.java,
//				   	 TheGame.java
// Semester:         367 Fall 2015
//
// Author:           Xiaojun He
// Email:            xhe66@wisc.edu
// CS Login:         xiaojun
// Lecturer's Name:  Jim Skrentny
//
//////////////////// PAIR PROGRAMMERS COMPLETE THIS SECTION ////////////////////
//
// Pair Partner:     Junjie Xu
// Email:            (email address of your programming partner)
// CS Login:         (partner's login name)
// Lecturer's Name:  Jim Skrentny
//
////////////////////////////////////////////////////////////////////////////////
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;
import java.util.Set;
/**
 * This is the main class that runs the whole game
 * 
 * @author Xiaojun He
 *
 */
public class TheGame {
	private static String gameIntro; // initial introduction to the game
	private static String winningMessage; // winning message of game
	private static String gameInfo; // additional game info
	private static boolean gameWon = false; // state of the game
	private static Scanner scanner = null; // for reading files
	private static Scanner ioscanner = null; // for reading standard input
	private static Player player; // object for player of the game
	private static Room location; // current room in which player is located
	private static Room winningRoom; // Room which player must reach to win
	private static Item winningItem; // Item which player must find
	private static DirectedGraph<Room> layout; // Graph structure of the Rooms

	public static void main(String[] args) {
		if (args.length != 1) {
			System.err.println("Bad invocation! Correct usage: " + "java AppStore <gameFile>");
			System.exit(1);
		}

		boolean didInitialize = initializeGame(args[0]);

		if (!didInitialize) {
			System.err.println("Failed to initialize the application!");
			System.exit(1);
		}

		System.out.println(gameIntro); // game intro

		processUserCommands();
	}
/**
 * This is the method that intialize the game and read in files
 * 
 * @param gameFile: the name of the files to be read
 * @return true if initialization is succeeded, false otherwise
 */
	private static boolean initializeGame(String gameFile) {

		try {
			// reads player name
			System.out.println("Welcome worthy squire! What might be your name?");
			ioscanner = new Scanner(System.in);
			String playerName = ioscanner.nextLine();

			
			/*
			 * read the contents of the input file using Java File IO
			 * and then process them to initializeplayer and layout
			 * (DirectedGraph)
			 */
			layout= new DirectedGraph<Room>();
			File file = new File(gameFile);
			scanner = new Scanner(file);
			gameIntro = scanner.nextLine();
			winningMessage = scanner.nextLine();
			gameInfo = scanner.nextLine();
			String line;
			String name;
			String roomDes;
			String description;
			boolean activated;
			String roomName;
			String message;
			boolean oneTimeUse;
			String usedString;
			boolean visibility;
			boolean habitability;
			String habMsg=null;
			String[] roomPair;
			HashSet<Item> startItems = new HashSet();
			HashSet<Item> roomItems;
			ArrayList<MessageHandler> handlers;
			location=null;
			
			line = scanner.nextLine();
			
			// Start reading the whole file
			while (scanner.hasNextLine()) {
				if (line.contains("#player")) {
					line = scanner.nextLine().trim();
					//reading the intial items of a player
					while (line.contains("#item")) {
						boolean winItem=false;
						if (line.contains("win")) {
							winItem=true;
						}
						name = scanner.nextLine().trim();
						description = scanner.nextLine().trim();
						activated = scanner.nextLine().contains("true");
						message = scanner.nextLine().trim();
						oneTimeUse = scanner.nextLine().contains("true");
						usedString = scanner.nextLine().trim();
						
						Item newItem=new Item(name, description, activated, 
								message, oneTimeUse, usedString);
						if (winItem){
							winningItem=newItem;
						}
						startItems.add(newItem);
						line = scanner.nextLine().trim();
					}
				}
				player=new Player(playerName, startItems);
				//reading rooms and items in it
				while (line.contains("#room")) {
					roomItems = new HashSet();
					boolean isWin=false;
					if (line.contains("win")) {
						isWin=true;
					}
					roomName = scanner.nextLine().trim();
					roomDes = scanner.nextLine().trim();
					visibility = scanner.nextLine().contains("true");
					habitability = scanner.nextLine().contains("true");
					if (habitability==false){
						habMsg= scanner.nextLine().trim();
					}
					line = scanner.nextLine().trim();
					while (line.contains("#item")) {
						boolean winItem=false;
						if (line.contains("win")) {
							winItem=true;
						}
						name = scanner.nextLine().trim();
						description = scanner.nextLine().trim();
						activated = scanner.nextLine().contains("true");
						message = scanner.nextLine().trim();
						oneTimeUse = scanner.nextLine().contains("true");
						usedString = scanner.nextLine().trim();
						// construct an item and put it to the room
						Item newItem=new Item(name, description, activated, message, oneTimeUse, usedString);
						if (winItem){
							winningItem=newItem;
						}
						roomItems.add(newItem);
						line = scanner.nextLine().trim();
					}
					handlers=new ArrayList<MessageHandler>();
					//read in message handler for each room
					while (line.contains("#messageHandler")) {
						message = scanner.nextLine().trim();
						String type;
						String unlockRoom=null;
						String secLine = scanner.nextLine().trim();
						if (secLine.contains("room")) {
							unlockRoom = scanner.nextLine().trim();
						} 
						handlers.add(new MessageHandler(message, secLine, unlockRoom));
						line = scanner.nextLine().trim();
					}
					//construct a new room
					Room newRoom = new Room(roomName, roomDes, visibility, habitability, habMsg, roomItems, handlers);
					//set the first location to current location
					if (location==null){
						location=newRoom;
					}
					//set the winningRoom
					if (isWin){
						winningRoom=newRoom;
					}
					
					layout.addVertex(newRoom);
				}
				//read in locked meesage
				if (line.contains("#locked passages")) {
					Room room1, room2;
					String lockMessage;
					line = scanner.nextLine().trim();
					
					while (!line.contains("#Adjacency List:")) {
						room1 = null;
						room2 = null;
						roomPair = line.split(" ");
						line = scanner.nextLine().trim();
						lockMessage = line;
						Iterator<Room> itr = layout.getAllVertices().iterator();
						while (itr.hasNext()) {
							Room currRoom = itr.next();
							if (roomPair[0].equals(currRoom.getName())) {
								room1 = currRoom;
							} else if (roomPair[1].equals(currRoom.getName())) {
								room2 = currRoom;
							}
							if ((room1 != null) && (room2 != null)) {
								room1.addLockedPassage(room2, lockMessage);
								break;
							}
						}
						line = scanner.nextLine().trim();
					}
				}
				//reading adjacency list
				if (line.contains("#Adjacency List:")) {
					Room room1, room2;
					while (scanner.hasNextLine()) {
						room1 = null;
						room2 = null;
						line = scanner.nextLine().trim();
						roomPair = line.split(" ");
						if (roomPair.length<2) continue;
						Iterator<Room> itr = layout.getAllVertices().iterator();
						while (itr.hasNext()) {
							Room currRoom = itr.next();
							if (roomPair[0].equals(currRoom.getName())) {
								room1 = currRoom;
							} else if (roomPair[1].equals(currRoom.getName())) {
								room2 = currRoom;
							}
							if ((room1 != null) && (room2 != null)) {
								layout.addEdge(room1, room2);
								break;
							}
						}
				
					}
				}
			}

			return true;
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			return false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	private static void processUserCommands() {
		String command = null;
		do {

			System.out.print("\nPlease Enter a command ([H]elp):");
			command = ioscanner.next();
			switch (command.toLowerCase()) {
			case "p": // pick up
				processPickUp(ioscanner.nextLine().trim());
				goalStateReached();
				break;
			case "d": // put down item
				processPutDown(ioscanner.nextLine().trim());
				break;
			case "u": // use item
				processUse(ioscanner.nextLine().trim());
				break;
			case "lr":// look around
				processLookAround();
				break;
			case "lt":// look at
				processLookAt(ioscanner.nextLine().trim());
				break;
			case "ls":// look at sack
				System.out.println(player.printSack());
				break;
			case "g":// goto room
				processGoTo(ioscanner.nextLine().trim());
				goalStateReached();
				break;
			case "q":
				System.out.println("You Quit! You, " + player.getName() + ", are a loser!!");
				break;
			case "i":
				System.out.println(gameInfo);
				break;
			case "h":
				System.out.println("\nCommands are indicated in [], and may be followed by \n"
						+ "any additional information which may be needed, indicated within <>.\n"
						+ "\t[p]  pick up item: <item name>\n" + "\t[d]  put down item: <item name>\n"
						+ "\t[u]  use item: <item name>\n" + "\t[lr] look around\n"
						+ "\t[lt] look at item: <item name>\n" + "\t[ls] look in your magic sack\n"
						+ "\t[g]  go to: <destination name>\n" + "\t[q]  quit\n" + "\t[i]  game info\n");
				break;
			default:
				System.out.println("Unrecognized Command!");
				break;
			}
		} while (!command.equalsIgnoreCase("q") && !gameWon);
		ioscanner.close();
	}

	private static void processLookAround() {
		System.out.print(location.toString());
		for (Room rm : layout.getNeighbors(location)) {
			System.out.println(rm.getName());
		}
	}

	private static void processLookAt(String item) {
		Item itm = player.findItem(item);
		if (itm == null) {
			itm = location.findItem(item);
		}
		if (itm == null) {
			System.out.println(item + " not found");
		} else
			System.out.println(itm.toString());
	}

	private static void processPickUp(String item) {
		if (player.findItem(item) != null) {
			System.out.println(item + " already in sack");
			return;
		}
		Item newItem = location.findItem(item);
		if (newItem == null) {
			System.out.println("Could not find " + item);
			return;
		}
		player.addItem(newItem);
		location.removeItem(newItem);
		System.out.println("You picked up ");
		System.out.println(newItem.toString());
	}

	private static void processPutDown(String item) {
		if (player.findItem(item) == null) {
			System.out.println(item + " not in sack");
			return;
		}
		Item newItem = player.findItem(item);
		location.addItem(newItem);
		player.removeItem(newItem);
		System.out.println("You put down " + item);
	}

	private static void processUse(String item) {
		Item newItem = player.findItem(item);
		if (newItem == null) {
			System.out.println("Your magic sack doesn't have a " + item);
			return;
		}
		if (newItem.activated()) {
			System.out.println(item + " already in use");
			return;
		}
		if (notifyRoom(newItem)) {
			if (newItem.isOneTimeUse()) {
				player.removeItem(newItem);
			}
		}
	}

	private static void processGoTo(String destination) {
		Room dest = findRoomInNeighbours(destination);
		if (dest == null) {
			for (Room rm : location.getLockedPassages().keySet()) {
				if (rm.getName().equalsIgnoreCase(destination)) {
					System.out.println(location.getLockedPassages().get(rm));
					return;
				}
			}
			System.out.println("Cannot go to " + destination + " from here");
			return;
		}
		Room prevLoc = location;
		location = dest;
		if (!player.getActiveItems().isEmpty())
			System.out.println("The following items are active:");
		for (Item itm : player.getActiveItems()) {
			notifyRoom(itm);
		}
		if (!dest.isHabitable()) {
			System.out.println("Thou shall not pass because");
			System.out.println(dest.getHabitableMsg());
			location = prevLoc;
			return;
		}

		System.out.println();
		processLookAround();
	}

	private static boolean notifyRoom(Item item) {
		Room toUnlock = location.receiveMessage(item.on_use());
		if (toUnlock == null) {
			if (!item.activated())
				System.out.println("The " + item.getName() + " cannot be used here");
			return false;
		} else if (toUnlock == location) {
			System.out.println(item.getName() + ": " + item.on_useString());
			item.activate();
		} else {
			// add edge from location to to Unlock
			layout.addEdge(location, toUnlock);
			if (!item.activated())
				System.out.println(item.on_useString());
			item.activate();
		}
		return true;
	}

	private static Room findRoomInNeighbours(String room) {
		Set<Room> neighbours = layout.getNeighbors(location);
		for (Room rm : neighbours) {
			if (rm.getName().equalsIgnoreCase(room)) {
				return rm;
			}
		}
		return null;
	}

	private static void goalStateReached() {
		if ((location == winningRoom && player.hasItem(winningItem))
				|| (location == winningRoom && winningItem == null)) {
			System.out.println("Congratulations, " + player.getName() + "!");
			System.out.println(winningMessage);
			System.out.println(gameInfo);
			gameWon = true;
		}
	}

}
