///////////////////////////////////////////////////////////////////////////////
//                   ALL STUDENTS COMPLETE THESE SECTIONS
// Main Class File:  UWmail.java
// File:             Conversation.java
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

//necessary imports
import java.util.Iterator;

/**
 * Contains a constructor for a Conversation Iterable and all associated methods
 * for retrieving or adding data to a Conversation.
 *
 * <p>
 * Bugs: (none known)
 *
 * @author Arup Arcalgud
 * @author Xiaojun He
 */
public class Conversation implements Iterable<Email> {
	// private member variables
	private DoublyLinkedList<Email> convo; // DoublyLinkedList that holds emails
	private int currentIndex; // Pointer to current position in the conversation
	private int numEmails; // number of emails in the conversation

	/**
	 * Constructs a Conversation object with a given email.
	 *
	 * @param Email
	 *            e An email with which to start an email conversation
	 */
	public Conversation(Email e) {
		// If no email is given, throw an IllegalArgumentException
		if (e == null) {
			throw new IllegalArgumentException("Null parameter was passed");
		}
		convo = new DoublyLinkedList<Email>(); // initialize the conversation
		convo.add(e); // add the first email to the conversation
		currentIndex = 0; // set the current index to the first email in the
							// conversation
		numEmails = 1; // initialize the number of emails in the conversation

	}

	/**
	 * Returns the index of the email which the user had in focus last time they
	 * viewed this conversation. If the Conversation has not been viewed yet,
	 * then return index of the last email in the conversation (the newest).
	 *
	 * @return the index that is currently being pointed to
	 */
	public int getCurrent() {
		return currentIndex; // return the current index
	}

	/**
	 * Move the pointer to the last viewed email back one, i.e. the user is
	 * viewing a conversation and presses p for the previous message. Should not
	 * move the pointer before the beginning of the list.
	 *
	 * 
	 */
	public void moveCurrentBack() {

		// as long as the current index is not exceeding the number of emails
		// in the conversation, allow the pointer to move
		if (currentIndex != numEmails - 1) {
			currentIndex++;
		}
	}

	/**
	 * Move the pointer to the last viewed email forward one, i.e. the user is
	 * viewing a conversation and presses n for the next message. Should not
	 * move the pointer past the end of the list.
	 *
	 * 
	 */
	public void moveCurrentForward() {

		// as long as the current index is not below the starting index of
		// the conversation, allow the pointer to move
		if (currentIndex != 0) {
			currentIndex--;
		}
	}

	/**
	 * Return the number of emails in the conversation
	 *
	 * 
	 */
	public int size() {
		// return number of emails
		return numEmails;
	}

	/**
	 * Return the nth Email from the conversation
	 *
	 * 
	 */
	public Email get(int n) {
		// Check for null inputs, if so, throw an exception
		if (n < 0 || n > numEmails - 1) {
			throw new IllegalArgumentException("position was invalid");
		}

		Email toBeReturned = null;

		return toBeReturned = convo.get(n);

	}

	/**
	 * Add the email to the conversation. We can assume that all emails in the
	 * .zip are in reverse chronological order, so every call to add(Email e)
	 * should be with an email that is older than the last.
	 *
	 * 
	 */
	public void add(Email e) {
		// if null parameter is passed, throw an exception
		if (e == null) {
			throw new IllegalArgumentException("No email was given");
		}

		convo.add(e); // add the email to the conversation
		numEmails++; // increment the number of emails in the conversation
	}

	/**
	 * Return an Iterator that can be used to iterate over the emails in the
	 * conversation.
	 *
	 * 
	 */
	public Iterator<Email> iterator() {
		// create an iterator for the conversation and return it
		Iterator<Email> conversationItr = convo.iterator();
		return conversationItr;
	}

}
