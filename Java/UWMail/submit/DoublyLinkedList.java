///////////////////////////////////////////////////////////////////////////////
//                   ALL STUDENTS COMPLETE THESE SECTIONS
// Main Class File:  UWmail.java
// File:             DoublyLinkedList.java
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
import java.util.NoSuchElementException;

/**
 * Implements the ListADT interface. Contains a constructor for a
 * DoublyLinkedList and all associated methods for retrieving and adding data to
 * the list.
 *
 * <p>
 * Bugs: (none known)
 *
 * @author Arup Arcalgud
 * @author Xiaojun He
 */
public class DoublyLinkedList<E> implements ListADT<E> {
	private int numItems; // number of items in the list
	private Listnode<E> head; // head node of the list
	private Listnode<E> tail; // tail node of the list
	private E data; // data contained in each Listnode

	/**
	 * Constructs a DoublyLinkedList() with a head and tail reference
	 *
	 */
	public DoublyLinkedList() {
		head = null; // initialize the head
		tail = null; // initialize the tail
		numItems = 0; // initialize the number of items in the list
	}

	/**
	 * Returns an iterator to traverse a DoublyLinkedList
	 */
	@Override
	public Iterator<E> iterator() {
		// return the iterator after passing the head of the DoublyLinkedList
		// to the DoublyLinkedListIterator<>() method
		return new DoublyLinkedListIterator<E>(head);
	}

	/**
	 * Adds item to the end of the List.
	 * 
	 * @param item
	 *            the item to add
	 * @throws IllegalArgumentException
	 *             if item is null
	 */
	@Override
	public void add(E item) {
		// test for null parameters, if so throw an exception
		if (item == null) {
			throw new IllegalArgumentException("A null parameter was passed");
		}
		Listnode<E> addThis = new Listnode<E>(item); // make a new listnode to
														// add
		Listnode<E> curr = head; // temporary pointer to the front of the list

		// if there are no items in the list, add the item as the first item
		if (head == null) {
			head = addThis; // set the new Listnode as both the head
			tail = addThis; // and tail (since its the only item currently in
							// the DoublyLinkedList)
			numItems++; // increment the number of items in the list
			return; // stop the method from running the rest of the code

		}

		// Otherwise, if there are already other items in the list:
		// traverse the nodes in the chain and get to the last node
		while (curr.getNext() != null) {
			curr = curr.getNext();
		}
		curr.setNext(addThis); // add the new node to the end of the chain
		addThis.setPrev(curr); // curr is the previous node
		tail = addThis;// move tail to the new node
		numItems++; // increment the count of nodes
	}

	/**
	 * Adds item at position pos in the List, moving the items originally in
	 * positions pos through size() - 1 one place to the right to make room.
	 * 
	 * @param pos
	 *            the position at which to add the item
	 * @param item
	 *            the item to add
	 * @throws IllegalArgumentException
	 *             if item is null
	 * @throws IndexOutOfBoundsException
	 *             if pos is less than 0 or greater than size()
	 */
	@Override
	public void add(int pos, E item) {
		// test for illegal parameters, if so throw an exception
		if (pos < 0 || pos > numItems) {
			throw new IllegalArgumentException("position invalid");
		}
		if (item == null) {
			throw new IllegalArgumentException("No item entered");
		}
		if (pos == numItems) {
			this.add(item);
			return;
		}
		Listnode<E> curr = head; // temporary pointer to the front of the list
		Listnode<E> addThis = new Listnode<E>(item); // make a new listnode to
		// hold the item passed in
		// if specified position is zero, add to front of list
		if (pos == 0) {
			addThis.setNext(head); // set the new item in front of the
									// current head
			head.setPrev(addThis);// link the current head back to the new item
			head = addThis; // set head to the new item
			numItems++; // increment number of items in the list
			return; // stop the rest of the code from running
		}

		// Otherwise, if the pos specified is in the middle of the list
		// move pointer to the desired position
		for (int i = 0; i < pos; i++) {
			curr = curr.getNext();
		}
		curr.getPrev().setNext(addThis); // add the node in that position

		addThis.setNext(curr); // connect the new node to the next
								// node
		addThis.setPrev(curr.getPrev());// connect the new node to the previous
										// node
		curr.setPrev(addThis);

		numItems++; // increment number of items in the list

	}

	/**
	 * Returns true iff item is in the List (i.e., there is an item x in the
	 * List such that x.equals(item))
	 * 
	 * @param item
	 *            the item to check
	 * @return true if item is in the List, false otherwise
	 */
	@Override
	public boolean contains(E item) {
		// check for null parameters, if so throw an exception
		if (item == null) {
			throw new IllegalArgumentException("no parameter was entered");
		}

		boolean contained = false; // make a flag for checking if the item is in
									// the list

		Listnode<E> curr = head; // make a temporary reference to the head node

		// traverse the list, check whether the item is in the list. If so,
		// return true and come out of the checking loop
		while (curr != null) {
			if (curr.getData() == item) {
				contained = true;
				break;
			}
			curr = curr.getNext();
		}

		return contained; // return the boolean flag
	}

	/**
	 * Returns the item at position pos in the List.
	 * 
	 * @param pos
	 *            the position of the item to return
	 * @return the item at position pos
	 * @throws IndexOutOfBoundsException
	 *             if pos is less than 0 or greater than or equal to size()
	 */
	@Override
	public E get(int pos) {
		// if an illegal value is passed, throw an exception
		if (pos < 0 || pos > numItems - 1) {
			throw new IllegalArgumentException("position was invalid");
		}

		Listnode<E> curr = head; // temporary reference to head node

		// move pointer to the desired position
		for (int i = 0; i < pos; i++) {
			curr = curr.getNext();
		}
		return (E) curr.getData(); // return the data at the specified position
	}

	/**
	 * Returns true iff the List is empty.
	 * 
	 * @return true if the List is empty, false otherwise
	 */
	@Override
	public boolean isEmpty() {
		// If the head is null, the list is empty. So return true.
		// otherwise return false.
		if (head == null) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * Removes and returns the item at position pos in the List, moving the
	 * items originally in positions pos+1 through size() - 1 one place to the
	 * left to fill in the gap.
	 * 
	 * @param pos
	 *            the position at which to remove the item
	 * @return the item at position pos
	 * @throws IndexOutOfBoundsException
	 *             if pos is less than 0 or greater than or equal to size()
	 */
	@Override
	public E remove(int pos) {
		// check for illegal parameter value, if so throw an exception
		if (pos < 0 || pos > numItems - 1) {
			throw new IllegalArgumentException("position was less than 0");
		}

		Listnode<E> curr = head; // temporary head node reference
		Listnode<E> wasRemoved; // initialize a Listnode that will later hold
								// the node that was removed

		// if the position specified is the position of the first node
		if (pos == 0) {
			wasRemoved = curr; // save the node that is being removed
			head = curr.getNext(); // make the head point to the next node
									// instead
			numItems--; // decrement the number of nodes
			return (E) wasRemoved; // return the node that was removed
		}

		// if the position specified is the last node
		if (pos == (numItems - 1)) {
			// move pointer to the desired position
			wasRemoved = tail;
			tail = tail.getPrev();
			tail.setNext(null);

		} else // if the position specified is of the last node in the list
		{
			// move pointer to the desired position
			for (int i = 0; i < pos; i++) {
				curr = curr.getNext();
			}

			// find the Listnode to be removed, and remove it by linking its
			// previous and next nodes together
			wasRemoved = curr;
			curr.getPrev().setNext(curr.getNext());
			curr.getNext().setPrev(curr.getPrev());
		}
		numItems--; // decrement the number of items in the list
		return (E) wasRemoved; // return what was removed
	}

	/**
	 * Returns the number of items in the List.
	 * 
	 * @return the number of items in the List
	 */
	@Override
	public int size() {
		// return the number of items
		return numItems;
	}

}
