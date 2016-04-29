///////////////////////////////////////////////////////////////////////////////
//                   ALL STUDENTS COMPLETE THESE SECTIONS
// Main Class File:  UWmail.java
// File:             DoublyLinkedListIterator.java
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
 * DoublyLinkedListIterator implements the Iterator interface. It provides an
 * iterator for a DoublyLinkedList, with methods to traverse and retrieve data
 * from the list.
 *
 * <p>
 * Bugs: (none known)
 *
 * @author Arup Arcalgud
 * @author Xiaojun He
 */
public class DoublyLinkedListIterator<E> implements Iterator<E> {
	// instance variables
	private Listnode<E> curr; // current position marker

	/**
	 * Constructor for a DoublyLinkedListIterator
	 *
	 * @param Listnode
	 *            <E> head The head node for a DoublyLinkedList
	 *
	 */
	public DoublyLinkedListIterator(Listnode<E> head) {
		// set current position to the head of the DoublyLinkedList
		curr = head;
	}

	/**
	 * Check to see if the DoublyLinkedList has a next element.
	 * 
	 * @return true if there the list has a next element, false otherwise.
	 */
	@Override
	public boolean hasNext() {
		// If curr is not null, return true. Else return false.
		return curr != null;
	}

	/**
	 * Returns the next element in the DoublyLinkedList
	 *
	 * @return the next element in the DoublyLinkedList
	 */
	@Override
	public E next() {
		// TODO Auto-generated method stub
		E item = null;
		item = curr.getData();
		curr = curr.getNext();
		return item;
	}

	/**
	 * Throws an UnsupportedOperationException
	 */
	public void remove() {
		throw new UnsupportedOperationException();
	}

}
