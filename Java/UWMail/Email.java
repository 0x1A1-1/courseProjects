///////////////////////////////////////////////////////////////////////////////
//                   ALL STUDENTS COMPLETE THESE SECTIONS
// Main Class File:  UWmail.java
// File:             Email.java
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
// Persons:         None
//
// Online sources:   avoid web searches to solve your problems, but if you do
//                   search, be sure to include Web URLs and description of 
//                   of any information you find.
//////////////////////////// 80 columns wide //////////////////////////////////

//necessary imports
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Contains the constructor for an Email object and all associated methods for
 * retrieving data from an Email object.
 *
 * <p>
 * Bugs: (none known)
 *
 * @author Arup Arcalgud
 * @author Xiaojun He
 */
public class Email {
	// private member variables for storing individual data pieces of an Email
	private Date date;
	private String messageID;
	private String subject;
	private String from;
	private String to;
	private ListADT<String> body;
	private String inReplyTo;
	private ListADT<String> references;

	/**
	 * Constructs an Email with the given attributes. This is the constructor
	 * for an email that is the first in the conversation, i.e. without
	 * In-Reply-To or References fields.
	 *
	 * @param Date
	 *            date date of the email
	 * @param String
	 *            messageID messageID of the email
	 * @param String
	 *            subject the subject of the email
	 * @param String
	 *            from the sender of the email
	 * @param String
	 *            to the recipient of the email
	 * @param ListADT
	 *            <String> body A list containing the body of the email
	 */
	public Email(Date date, String messageID, String subject, String from,
			String to, ListADT<String> body) {
		// initialize all instance variables
		this.date = date;
		this.messageID = messageID;
		this.subject = subject;
		this.from = from;
		this.to = to;
		this.body = body;
	}

	/**
	 * Constructs an Email with the given attributes. This is the constructor
	 * for an email that is not the first in the conversation, i.e. contains
	 * In-Reply-To and References fields.
	 *
	 * @param Date
	 *            date date of the email
	 * @param String
	 *            messageID messageID of the email
	 * @param String
	 *            subject the subject of the email
	 * @param String
	 *            from the sender of the email
	 * @param String
	 *            to the recipient of the email
	 * @param ListADT
	 *            <String> body A list containing the body of the email
	 * @param String
	 *            inReplyTo Reference to the original email
	 * @param ListADT
	 *            <String> references A list containing references
	 */
	public Email(Date date, String messageID, String subject, String from,
			String to, ListADT<String> body, String inReplyTo,
			ListADT<String> references) {
		// initialize all instance variables
		this.date = date;
		this.messageID = messageID;
		this.subject = subject;
		this.from = from;
		this.to = to;
		this.body = body;

		this.inReplyTo = inReplyTo;
		this.references = references;
	}

	/**
	 * Return the date in a human-readable form. If the date on the email is
	 * today, then you should format it with a SimpleDateFormat object and the
	 * formatting string "h:mm a". Otherwise, format it with a SimpleDateFormat
	 * object and the formatting string "MMM d".
	 *
	 * @return the formatted Date as a String
	 */
	public String getDate() {
		// Get today's date
		Date todaysDate = Calendar.getInstance().getTime();
		Format dateFormatter; // declare a Format object to format the Date
		String dateString; // String to hold the formatted date

		// if the Date in the email is todays date
		if (this.date == todaysDate) {
			// format it based on "h:mm a" format and store the date as a String
			dateFormatter = new SimpleDateFormat("h:mm a");
			dateString = dateFormatter.format(this.date);
		} else {
			// format it based on "MMM d" format and store the as a String
			dateFormatter = new SimpleDateFormat("MMM d");
			dateString = dateFormatter.format(this.date);
		}
		return dateString; // return the String containing the date
	}

	/**
	 * Return the unique email identifier that was stored in the Message-ID
	 * field.
	 *
	 * @return the message ID as a String
	 */
	public String getMessageID() {

		return this.messageID;
	}

	/**
	 * Return what was stored in the Subject: field.
	 *
	 * @return the subject as a String
	 */
	public String getSubject() {

		return this.subject;
	}

	/**
	 * Return what was stored in the From: field.
	 *
	 * @return the sender as a String
	 */
	public String getFrom() {

		return this.from;
	}

	/**
	 * Return what was stored in the To: field.
	 *
	 * @return the recipient as a String
	 */
	public String getTo() {

		return this.to;
	}

	/**
	 * Return the lines of text from the end of the header to the end of the
	 * file.
	 *
	 * @return the body of the email as a ListADT of Strings
	 */
	public ListADT<String> getBody() {

		return this.body;
	}

	/**
	 * Return what was stored in the In-Reply-To: field.If the email was the
	 * first in the conversation, return null.
	 *
	 * @return String containing In-Reply-To: information if email contains
	 *         In-Reply-To information, null otherwise
	 */
	public String getInReplyTo() {

		if (this.inReplyTo == null) {
			return null;
		}
		return this.inReplyTo;

	}

	/**
	 * Return the Message-ID's from the References: field. If the email was the
	 * first in the conversation, return null.
	 *
	 * @return String containing References: information if email contains
	 *         References information, null otherwise
	 */
	public ListADT<String> getReferences() {

		if (this.references == null) {
			return null;
		}
		return this.references;
	}
}
