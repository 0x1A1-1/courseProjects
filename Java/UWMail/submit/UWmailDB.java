///////////////////////////////////////////////////////////////////////////////
//                   ALL STUDENTS COMPLETE THESE SECTIONS
// Main Class File:  UWmail.java
// File:             UWmailDB.java
// Semester:         CS367 Fall 2015
//
// Author:           Arup Arcalgud, arup@cs.wisc.edu
// CS Login:         arup
// Lecturer's Name:  Jim Skrentny
// Lab Section:      Lecture 1
//
//////////////////// PAIR PROGRAMMERS COMPLETE THIS SECTION ////////////////////
//
// Pair Partner:     Xiaojun He
// Email:            xhe66@wisc.edu
// CS Login:         xiaojun
// Lecturer's Name:  Jim Skrentny
// Lab Section:      Lecture 1
//
//////////////////// STUDENTS WHO GET HELP FROM OTHER THAN THEIR PARTNER //////
//                   fully acknowledge and credit all sources of help,
//                   other than Instructors and TAs.
//
// Persons:         Random students in the CS labs (we don't know their names)
//
// Online sources:   avoid web searches to solve your problems, but if you do
//                   search, be sure to include Web URLs and description of 
//                   of any information you find.
//////////////////////////// 80 columns wide //////////////////////////////////

/**
 * The UWmailDB class represents the user's UWmail account, consisting of the
 * inbox and the trash.
 *
 * <p>
 * Bugs: (none known)
 *
 * @author Arup Arcalgud
 * @author Xiaojun He
 */
public class UWmailDB {
	// instance variable declarations
	private int inboxNum; // number of conversations in the inbox
	private int trashNum; // number of conversations in the trash
	private DoublyLinkedList<Conversation> inbox; // List containing inbox
													// conversations
	private DoublyLinkedList<Conversation> trash;// List containing trash
													// conversations

	/**
	 * Constructs an empty UWmailDB.
	 *
	 */
	public UWmailDB() {
		inbox = new DoublyLinkedList<Conversation>(); // initialize the inbox
		trash = new DoublyLinkedList<Conversation>();// initialize the trash
		inboxNum = 0; // initialize the number of conversations in inbox
		trashNum = 0; // initialize the number of conversations in trash
	}

	/**
	 * Return the number of conversations in the inbox.
	 */
	public int size() {
		return inboxNum; // return number of conversations in inbox

	}

	/**
	 * Determines the correct email conversation to add e to, and does so. If
	 * there is no such conversation, it must add a new one to the inbox.
	 *
	 * @param Email
	 *            e the email to be added to a conversation
	 */
	public void addEmail(Email e) {

		// if the inbox contains nothing, make a new conversation out of
		// new email
		if (inbox.isEmpty()) {
			Conversation newC = new Conversation(e);
			inbox.add(newC);
			inboxNum++; // increment number of conversations in the inbox
			return; // stop the rest of the code from running
		}

		// if there are conversations in the inbox, try to find a conversation
		// with the same subject as Email e
		for (int i = 0; i < inbox.size(); i++) {

			Conversation currCon = inbox.get(i);

			// compare the ealiest email of the conversation with email e,
			// add the email to the conversation if ealiest inReplyTo matches
			// email's messageID
			if (e.getMessageID().equals(
					currCon.get(currCon.size() - 1).getInReplyTo())) {
				inbox.get(i).add(e);
				return; // stop the rest of the code from running
			}
		}
		inbox.add(new Conversation(e)); // otherwise, add Email e to a new
										// conversation
		inboxNum++; // increment the number of converstions in the inbox
	}

	/**
	 * Returns a DoublyLinkedList of Conversation's, representing the
	 * conversations in the inbox.
	 *
	 * @return the DoublyLinkedList of Conversations in the inbox
	 */
	public ListADT<Conversation> getInbox() {
		return inbox; // return the inbox

	}

	/**
	 * Returns a DoublyLinkedList of Conversation's, representing the
	 * conversations in the trash.
	 *
	 * @return the DoublyLinkedList of Conversations in the trash
	 */
	public ListADT<Conversation> getTrash() {
		return trash; // return the trash
	}

	/**
	 * Moves the conversation at the nth index of the inbox to the trash.
	 *
	 */
	public void deleteConversation(int n) {
		// if an invalid parameter is passed, throw an exception
		if (n < 0 || n > inboxNum) {
			throw new IllegalArgumentException("invalid parameter");
		}

		trash.add(inbox.get(n)); // retrieve the nth item in inbox, add to trash
		inbox.remove(n); // remove the item from inbox
		inboxNum--; // decrement inbox
		trashNum++; // increment trash
	}

}
