///////////////////////////////////////////////////////////////////////////////
//                   ALL STUDENTS COMPLETE THESE SECTIONS
// Title:            UW Mail
// Files:            UWmail.java, Conversation.java, DoublyLinkedList.java,
//					 DoublyLinkedListIterator.java, ListADT.java, Listnode.java
//                   Email.java, UWmailDB.java, MalformedEmailException.java
// Semester:         CS367 Fall 2015
//
// Author:           Arup Arcalgud, Xiaojun He
// Email:            arup@cs.wisc.edu
// CS Login:         arup
// Lecturer's Name:  Jim Skrentny
// Lab Section:      Lecture 1
//
//////////////////// PAIR PROGRAMMERS COMPLETE THIS SECTION ////////////////////
//
//                   CHECK ASSIGNMENT PAGE TO see IF PAIR-PROGRAMMING IS ALLOWED
//                   If pair programming is allowed:
//                   1. Read PAIR-PROGRAMMING policy (in cs302 policy) 
//                   2. choose a partner wisely
//                   3. REGISTER THE TEAM BEFORE YOU WORK TOGETHER 
//                      a. one partner creates the team
//                      b. the other partner must join the team
//                   4. complete this section for each program file.
//
// Pair Partner:     Xiaojun He
// Email:            xhe66@wisc.edu
// CS Login:         xiaojun
// Lecturer's Name:  Jim Skrentny
// Lab Section:      Lecture 1
//
//////////////////// STUDENTS WHO GET HELP FROM OTHER THAN THEIR PARTNER //////
//                   must fully acknowledge and credit those sources of help.
//                   Instructors and TAs do not have to be credited here,
//                   but tutors, roommates, relatives, strangers, etc do.
//
// Persons:          Random students in the CS computer labs (we don't know 
//					 their specific names)
//
// Online sources:   avoid web searches to solve your problems, but if you do
//                   search, be sure to include Web URLs and description of 
//                   of any information you find.
//////////////////////////// 80 columns wide //////////////////////////////////

//necessary imports
import java.util.Date;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.Scanner;
import java.lang.Integer;
import java.lang.NumberFormatException;
import java.util.zip.ZipEntry;
import java.util.zip.ZipException;
import java.util.zip.ZipFile;
import java.io.IOException;
import java.io.InputStream;

/**
 * The application program, UWmail, creates and uses a UWmailDB to load and
 * present the user their inbox.
 *
 * <p>
 * Bugs: (none known)
 *
 * @author Arup Arcalgud
 * @author Xiaojun He
 */
public class UWmail {
	// TODO: private data members
	private static UWmailDB uwmailDB = new UWmailDB(); // the database for
														// emails
	private static final Scanner stdin = new Scanner(System.in); // to read .zip

	/**
	 * Reads in a .zip file with emails and creates a UWmailDB to store and
	 * present the user their inbox.
	 *
	 * @param String
	 *            args[] String array of arguments
	 * 
	 */
	public static void main(String args[]) {
		if (args.length != 1) {
			System.out.println("Usage: java UWmail [EMAIL_ZIP_FILE]");
			System.exit(0);
		}

		loadEmails(args[0]); // load emails into the database

		displayInbox(); // display the inbox with emails

	}

	/**
	 * Reads each String in the .zip file and creates Email objects with the
	 * information in the Strings. Then loads the UWmailDB with the Emails by
	 * creating Conversation objects that link emails of the same subject
	 * together.
	 *
	 * @param String
	 *            fileName String name of the zip file to be read
	 */
	private static void loadEmails(String fileName) {
		try (ZipFile zf = new ZipFile(fileName);) {
			Enumeration<? extends ZipEntry> entries = zf.entries();
			while (entries.hasMoreElements()) {
				Date date;
				String messageID;
				String subject;
				String from;
				String to;
				String inReplyTo = null;
				DoublyLinkedList<String> body = new DoublyLinkedList<String>();
				DoublyLinkedList<String> reference = new DoublyLinkedList<String>();
				ZipEntry ze = entries.nextElement();
				if (ze.getName().endsWith(".txt")) {
					InputStream in = zf.getInputStream(ze);
					Scanner sc = new Scanner(in);
					// above code was given to us for reading in the .zip file
					// initialize the Scanner
					String line = sc.nextLine();
					Email newmail; // declare a new email that we will later add

					// try to extract information from the zip folder
					// line-by-line, catch any MalformedEmailException
					// that may be thrown
					try {

						// read in In-Reply-To information if there's any
						if (line.contains("In-Reply-To")) {
							inReplyTo = line
									.substring("In-Reply-To: ".length());
							line = sc.nextLine();
							reference.add(line.substring("References: "
									.length()));
							line = sc.nextLine();
						}

						// read in Date
						if (!line.contains("Date: ")) {
							throw new MalformedEmailException();
						}
						date = new Date(line.substring("Date: ".length()));
						line = sc.nextLine();

						// read in Message-ID
						if (!line.contains("Message-ID: ")) {
							throw new MalformedEmailException();
						}
						messageID = line.substring("Message-ID: ".length());
						line = sc.nextLine();

						// read in Subject
						if (!line.contains("Subject: ")) {
							throw new MalformedEmailException();
						}
						subject = line.substring("Subject: ".length());
						line = sc.nextLine();

						// read in From: (sender of the email)
						if (!line.contains("From: ")) {
							throw new MalformedEmailException();
						}
						from = line.substring("From: ".length());
						line = sc.nextLine();

						// read in: (recepient of the email)
						if (!line.contains("To: ")) {
							throw new MalformedEmailException();
						}
						to = line.substring("To: ".length());

						// Add the rest of the Strings to the body of the email
						while (sc.hasNextLine()) {
							body.add(sc.nextLine());
						}
					} catch (MalformedEmailException e) {
						continue;
					}// if certain field was missing or empty, skip this email

					// If email contains In-Reply-To information, create an
					// Email object with In-Reply-To information
					if (inReplyTo == null) {
						newmail = new Email(date, messageID, subject, from, to,
								body);
					}

					// Otherwise create an Email without IN-Reply-To information
					else {
						newmail = new Email(date, messageID, subject, from, to,
								body, inReplyTo, reference);
					}
					uwmailDB.addEmail(newmail); // add that email to the
												// UWmailDB
				}
			}
		}

		// Catch any Exceptions that may be thrown while accessing the .zip file
		// or while accessing data of the .zip file
		catch (ZipException e) {
			System.out
					.println("A .zip format error has occurred for the file.");
			System.exit(1);
		} catch (IOException e) {
			System.out.println("An I/O error has occurred for the file.");
			System.exit(1);
		} catch (SecurityException e) {
			System.out.println("Unable to obtain read access for the file.");
			System.exit(1);
		}
	}

	/**
	 * Displays the user's inbox with email conversations that have been loaded.
	 *
	 */
	private static void displayInbox() {
		boolean done = false;
		// Print out the UI of the UWmail program
		System.out.println("Inbox: ");
		System.out
				.println("-----------------------------------------------------"
						+ "---------------------------");

		// If there are no email conversations in the UWmailDB, inform the user
		if (uwmailDB.size() == 0) {
			System.out.println("No conversations to show.");
		}

		// otherwise, display each email conversation in the UWmailDB
		else {
			Iterator<Conversation> inboxItr = uwmailDB.getInbox().iterator();
			for (int i = 0; i < uwmailDB.size(); i++) {
				Conversation tempCon = inboxItr.next();
				System.out.println("[" + i + "] "
						+ tempCon.get(tempCon.size() - 1).getSubject() + " ("
						+ tempCon.get(0).getDate() + ")");
			}
		}

		// Run the mechanics of the UWmail program (this code was given to us)
		while (!done) {
			System.out.print("Enter option ([#]Open conversation, [T]rash, "
					+ "[Q]uit): ");
			String input = stdin.nextLine();

			if (input.length() > 0) {

				int val = 0;
				boolean isNum = true;

				try {
					val = Integer.parseInt(input);
				} catch (NumberFormatException e) {
					isNum = false;
				}

				if (isNum) {
					if (val < 0) {
						System.out.println("The value can't be negative!");
						continue;
					} else if (val >= uwmailDB.size()) {
						System.out.println("Not a valid number!");
						continue;
					} else {
						displayConversation(val);
						continue;
					}

				}

				if (input.length() > 1) {
					System.out.println("Invalid command!");
					continue;
				}

				switch (input.charAt(0)) {
				case 'T':
				case 't':
					displayTrash();
					break;

				case 'Q':
				case 'q':
					System.out.println("Quitting...");
					done = true;
					break;

				default:
					System.out.println("Invalid command!");
					break;
				}
			}
		}
		System.exit(0);
	}

	/**
	 * Displays the "trash" folder of the user with deleted emails.
	 *
	 */
	private static void displayTrash() {
		boolean done = false;
		// Prints the UI of the the trash (deleted conversations)
		System.out.println("Trash: ");
		System.out
				.println("---------------------------------------------------"
						+ "-----------------------------");

		// If there is nothing in the trash, notify the user
		if (uwmailDB.getTrash().size() == 0) {
			System.out.println("No conversations to show.");
		}

		// otherwise print out each conversation in the trash
		else {

			// Make an iterator and iterate through each conversation in the
			// trash, printing each conversation along the way
			Iterator<Conversation> trashItr = uwmailDB.getTrash().iterator();
			for (int i = 0; i < uwmailDB.getTrash().size(); i++) {
				Conversation tempCon = trashItr.next();
				System.out.println("[" + i + "] "
						+ tempCon.get(tempCon.size() - 1).getSubject() + " ("
						+ tempCon.get(0).getDate() + ")");
			}
		}

		// Below code was given to us
		while (!done) {
			System.out.print("Enter option ([I]nbox, [Q]uit): ");
			String input = stdin.nextLine();

			if (input.length() > 0) {
				if (input.length() > 1) {
					System.out.println("Invalid command!");
					continue;
				}

				switch (input.charAt(0)) {
				case 'I':
				case 'i':
					displayInbox();
					break;

				case 'Q':
				case 'q':
					System.out.println("Quitting...");
					done = true;
					break;

				default:
					System.out.println("Invalid command!");
					break;
				}
			}
		}
		System.exit(0);
	}

	/**
	 * Displays a group of emails with the same subject.
	 *
	 * @param int val The option number of the desired conversation to view
	 * 
	 */
	private static void displayConversation(int val) {
		// Checks whether val is valid as a conversation number. If not,
		// takes the user back to the inbox view and continue processing
		// commands.
		if (val < 0 || val >= uwmailDB.size()) {
			System.out.println("No more conversation to be show!");
			displayInbox();
		}

		// Assuming the parameter is valid, proceed to print a conversation
		boolean done = false; // a flag for whether the display action was
								// successful

		// Go to the conversation specified by val
		Conversation currCon = uwmailDB.getInbox().get(val);

		// Print out the conversation information
		System.out.println("SUBJECT: "
				+ currCon.get(currCon.size() - 1).getSubject());
		System.out
				.println("---------------------------------------------------"
						+ "-----------------------------");

		// retrieve conversation information from individual emails in the
		// conversation
		for (int i = currCon.size() - 1; i >= 0; i--) {
			Email currE = currCon.get(i);
			if (i == currCon.getCurrent()) {
				System.out.println("From: " + currE.getFrom());
				System.out.println("To: " + currE.getTo());
				System.out.println(currE.getDate());
				System.out.println();
				for (int j = 0; j < currE.getBody().size(); j++) {
					System.out.println(currE.getBody().get(j));
				}
			} else {
				System.out.println(currE.getFrom() + " | "
						+ currE.getBody().get(0) + " | " + currE.getDate());
			}
			System.out
					.println("-----------------------------------------------"
							+ "---------------------------------");
		}

		// Print out the options in the UI for the UWmail program
		while (!done) {
			System.out.print("Enter option ([N]ext email, [P]revious email, "
					+ "[J]Next conversation, [K]Previous\nconversation,"
					+ " [I]nbox, " + "[#]Move to trash, [Q]uit): ");
			String input = stdin.nextLine();

			if (input.length() > 0) {

				if (input.length() > 1) {
					System.out.println("Invalid command!");
					continue;
				}

				switch (input.charAt(0)) {
				case 'P':
				case 'p':

					// for this conversation, move the current email
					// pointer back
					// using Conversation.moveCurrentBack().
					uwmailDB.getInbox().get(val).moveCurrentBack();
					displayConversation(val);
					break;
				case 'N':
				case 'n':

					// for this conversation, move the current email
					// pointer
					// forward using Conversation.moveCurrentForward().
					uwmailDB.getInbox().get(val).moveCurrentForward();
					//
					displayConversation(val);
					break;
				case 'J':
				case 'j':

					// Display the next conversation
					val++;
					displayConversation(val);
					break;

				case 'K':
				case 'k':

					// Display the previous conversation
					val--;
					displayConversation(val);
					break;

				case 'I':
				case 'i':
					displayInbox();
					return;

				case 'Q':
				case 'q':
					System.out.println("Quitting...");
					done = true;
					break;

				case '#':

					// add delete conversation functionality. This
					// conversation
					// will be moved to the trash when # is entered, and it
					// will
					// take the user back to the inbox and continue processing
					// input.
					uwmailDB.deleteConversation(val);
					displayInbox();
					return;

				default:
					System.out.println("Invalid command!");
					break;
				}
			}
		}
		System.exit(0);
	}

}
