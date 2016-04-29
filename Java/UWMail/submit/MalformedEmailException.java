///////////////////////////////////////////////////////////////////////////////
//                   ALL STUDENTS COMPLETE THESE SECTIONS// Main Class File:  UWmail.java
// File:             MalformedEmailException.java
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

//package declaration


/**
 * A checked exception class to be used when the parsed email does not conform
 * to the guidelines given: If there is a blank value for any required field of
 * an email, or if one of the required fields is omitted
 *
 * <p>
 * Bugs: (none)
 *
 * @author Arup Arcalgud
 * @author Xiaojun He
 */
public class MalformedEmailException extends Exception {

	/**
	 * Creates a MalformedEmailException
	 */
	public MalformedEmailException() {
		super(); // retrieve code from super class
	}

	/**
	 * Creates a MalformedEmailException with a message to be printed when the
	 * exception is thrown
	 * 
	 * @param String
	 *            message
	 */
	public MalformedEmailException(String message) {
		super(message); // retrieve code from super class, pass up the message
						// to be shown
	}
}
