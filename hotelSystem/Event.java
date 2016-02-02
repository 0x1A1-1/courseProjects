///////////////////////////////////////////////////////////////////////////////
//                   ALL STUDENTS COMPLETE THESE SECTIONS
// Main Class File:  Scheduler.java
// Files:            Event.java
// Semester:         CS367 Fall 2015
//
// Author:           Xiaojun He
// Email:            xhe66@wisc.edu
// CS Login:         xiaojun	
// Lecturer's Name:  Jim Skrentny
//
//////////////////// PAIR PROGRAMMERS COMPLETE THIS SECTION ////////////////////
//
// Pair Partner:     Zonglin Han
// Email:            zhan29@wisc.edu
// CS Login:         zonglin
// Lecturer's Name:  Jim Skrentny
//
////////////////////////////////////////////////////////////////////////////////
import java.text.DateFormat;
import java.text.SimpleDateFormat;

/**
 * Event represents events to be held in .
 */
public class Event implements Interval {
	private long myStart;
	private long myEnd;
	private String myName;
	private String myResource;
	private String myOrganization;
	private String myDescription;

	/**
	 * construct a event object
	 * 
	 * @param start
	 *            start time of event
	 * @param end
	 *            ending time of event
	 * @param name
	 *            name of the event
	 * @param resource
	 *            where the event would be held
	 * @param organization
	 *            who will hold the event
	 * @param description
	 *            what is event about
	 */
	Event(long start, long end, String name, String resource, 
			String organization, String description) {
		if (start > end || name == null || resource == null || 
				organization == null || description == null) {
			throw new IllegalArgumentException();
		}
		myStart = start;
		myEnd = end;
		myName = name;
		myResource = resource;
		myOrganization = organization;
		myDescription = description;

	}

	/**
	 * @return the start time of the event
	 */
	@Override
	public long getStart() {
		return myStart;
	}

	/**
	 * @return the end time of the event
	 */
	@Override
	public long getEnd() {
		return myEnd;
	}

	/**
	 * @return the name of the event
	 */
	public String getName() {
		return myName;
	}

	/**
	 * @return where the event will be held
	 */
	public String getResource() {
		return myResource;
	}

	/**
	 * @return who will hold the event
	 */
	public String getOrganization() {
		return myOrganization;
	}

	/**
	 * @return what the event is about
	 */
	public String getDescription() {
		return myDescription;
	}

	@Override
	/**
	 * compare two events' start time
	 */
	public int compareTo(Interval i) {
		// equal situation
		if (myStart < i.getStart()) {
			return -1;
		} else {
			return 1;
		}

	}

	/**
	 * check if two events are equal
	 * 
	 * @param e
	 *            another event
	 * @return true iff they have the same starting time
	 */
	public boolean equals(Event e) {
		if (myStart == e.getStart()) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 
	 * check if there's overlap between event i and current event
	 * 
	 * @param e
	 *            another event
	 * @return true if there overlap false if not
	 */
	@Override
	public boolean overlap(Interval i) {
		if (myStart < i.getEnd() && myEnd > i.getStart()) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * print the event in the format required
	 */
	@Override
	public String toString() {
		DateFormat userDate = new SimpleDateFormat("MM/dd/yyyy,HH:mm");
		String start = userDate.format(myStart * 1000);
		String end = userDate.format(myEnd * 1000);
		String temp = myName + "\n" + "By: " + myOrganization + "\n" + "In: "
				+ myResource + "\n" + "Start: " + start
				+ "\nEnd: " + end + "\nDescription: " + myDescription;

		return temp;
	}
}
