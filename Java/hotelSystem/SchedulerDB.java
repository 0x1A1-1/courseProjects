///////////////////////////////////////////////////////////////////////////////
//                   ALL STUDENTS COMPLETE THESE SECTIONS
// Main Class File:  Scheduler.java
// Files:            SchedulerDB.java
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
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.*;
/**
 * Database that holds all the information about scheduling
 * 
 * @author Xiaojun He/ Zonglin Han
 *
 */
public class SchedulerDB {
	private List<Resource> resources;
/**
 * construct a empty database
 */
	SchedulerDB() {
		resources = new ArrayList<Resource>();
	}
/**
 * add resource to database
 * @param resource: the name of the resource
 * @return true if add is successful, false otherwise
 */
	public boolean addResource(String resource) {
		if (resources.contains(findResource(resource))) {
			return false;
		}
		Resource newR = new Resource(resource);
		resources.add(newR);
		return true;
	}
	/**
	 * delete resource from database
	 * @param resource: the name of the resource
	 * @return true if delete is successful, false otherwise
	 */
	public boolean removeResource(String r) {
		if (resources.contains(findResource(r))) {
			resources.remove(findResource(r));
			return true;
		}
		return false;
	}
	/**
	 * add event to a specific resource
	 * @param r
	 * @param start
	 * @param end
	 * @param name
	 * @param organization
	 * @param description
	 * @return true if add was succesful, false otherwise
	 */
	public boolean addEvent(String r, long start, long end, String name, String organization, String description) {
		boolean success = false;
		Resource currResource = findResource(r);
		if (currResource == null) {
			return false;
		}
		try{
		Event newEvent = new Event(start, end, name, r, organization, description);
		success = currResource.addEvent(newEvent);
		}catch (IllegalArgumentException e){
			return false;
		}
		return success;
	}
/**
 * delete event from a specific resource
 * @param start: 
 * 			start time of the event
 * @param resource
 * 			name of the resource
 * @return true if delete was successful, false otherwise
 */
	public boolean deleteEvent(long start, String resource) {
		Resource currResource = findResource(resource);
		if (currResource != null && currResource.deleteEvent(start)) {
			return true;
		}
		return false;
	}
/**
 * find resource by the name provided
 * @param r
 * @return the resource if found ,null otherwise
 */
	public Resource findResource(String r) {
		for (int i = 0; i < resources.size(); i++) {
			if (r.equals(resources.get(i).getName())) {
				return resources.get(i);
			}
		}
		return null;
	}
/**
 * get all resources in the database
 * @return list of resources in the database
 */
	public List<Resource> getResources() {
		return resources;
	}
/**
 * get all events in a resource 
 * @param resource
 * @return list of events in a resource 
 */
	public List<Event> getEventsInResource(String resource) {
		Resource currResource = findResource(resource);
		Iterator<Event> itr = currResource.iterator();
		List<Event> temp = new ArrayList<Event>();
		while (itr.hasNext()) {
			temp.add((Event) itr.next());
		}
		return temp;
	}
	/**
	 * get all events in a time span 
	 * @param start: start time
	 * @param end: end time
	 * @return list of events in a time span
	 */
	public List<Event> getEventsInRange(long start, long end) {
		Event a = new Event(start, end, "", "", "", "");
		List<Event> eventIR = new ArrayList<Event>();
		for (int i = 0; i < resources.size(); i++) {
			Iterator<Event> itr = resources.get(i).iterator();
			while (itr.hasNext()) {
				Event currEvent = itr.next();
				if (currEvent.overlap(a)) {
					eventIR.add(currEvent);
				}
			}
		}
		return eventIR;
	}
/**
 * get all events in a time span in a resource
 * @param start: start time
 * @param end: end time
 * @param resource: resource name
 * @return the list of events in a time span in a resource
 */
	public List<Event> getEventsInRangeInResource(long start, long end, String resource) {
		Resource currResource = findResource(resource);
		Event a = new Event(start, end, "", "", "", "");
		List<Event> eventIRIR = new ArrayList<Event>();
		Iterator<Event> itr = currResource.iterator();
		while (itr.hasNext()) {
			Event currEvent = itr.next();
			if (currEvent.overlap(a)) {
				eventIRIR.add(currEvent);
			}
		}
		return eventIRIR;
	}
/**
 * get all events in the database
 * @return list of events
 */
	public List<Event> getAllEvents() {
		List<Event> eventAll = new ArrayList<Event>();
		for (int i = 0; i < resources.size(); i++) {
			Iterator<Event> itr = resources.get(i).iterator();
			while (itr.hasNext()) {
				eventAll.add(itr.next());
			}
		}
		return eventAll;
	}
/**
 * get all events for a specific organization
 * @param org: name of organization
 * @return list of events for a specific organization
 */
	public List<Event> getEventsForOrg(String org) {
		List<Event> eventForOrg = new ArrayList<Event>();
		List<Event> eventAll = getAllEvents();
		for (int i = 0; i < eventAll.size(); i++) {
			if (org.equals(eventAll.get(i).getOrganization())) {
				eventForOrg.add(eventAll.get(i));
			}
		}
		return eventForOrg;
	}
}
