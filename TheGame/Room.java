import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;


public class Room {
	//name of the room
	private	String	name;
	//description of the room
	private	String	description;
	//whether the room is lit or dark
	private	boolean	visibility;
	//whether the room is habitable
	private	boolean habitability;
	//reason for room not being habitable (only relevant when habitability is false)
	private String	habitableMsg;
	//items in the room
	private	Set<Item>	items;
	// message handlers
	private	List<MessageHandler> handlers;
	//locked rooms and the reason for their being locked
	private HashMap<Room, String> lockedPassages;	
	//Do not add anymore data members
	
	/**
	 * Constructs a new Room. 
	 * Checks if the parameters are valid otherwise throws an IllegalArgumentException.
	 * @param name room name
	 * @param description for room
	 * @param visibility whether the room is visible
	 * @param habitability whether the room is habitable
	 * @param habMsg message for why the room is habitatble
	 * @param items items in the room
	 * @param handlers for handling the message
	 */
	public Room(String name, String description, boolean visibility, boolean habitability,
			String habMsg, Set<Item> items, List<MessageHandler> handlers){
		if(name == null||description==null ||  items==null || handlers == null){
			throw new IllegalArgumentException();
		}
		if (habitability==false && habMsg==null){
			throw new IllegalArgumentException();
		}
		
		this.name = name;
		this.description = description;
		this.visibility = visibility;
		this.habitability = habitability;
		this.habitableMsg = habMsg;
		this.items = items;
		this.handlers = handlers;
		lockedPassages = new HashMap<Room,String>();
	}
	
	/**
	 * Getter method to get the Room's name
	 * @return the room name
	 */
	public String getName(){
    	return name;
	}
	
	/**
	 * Returns whether the visibility in the room is true or false
	 * @return visibility
	 */
	public boolean isVisible(){
    	return visibility;
	}
	
	/**
	 * Returns true if the room is habitable, otherwise returns false
	 * @return habitability
	 */
	public boolean isHabitable(){
    	return habitability;
	}
	
	/**
	 * If the room is not habitable, returns a String describing the reason why 
	 * it is not habitable. If the room is habitable returns null.
	 * @return
	 */
	public String getHabitableMsg(){
    	if(this.habitability == true){
    		return null;
    	}
    	return habitableMsg;
	}
	
	public HashMap<Room, String> getLockedPassages(){
    	return lockedPassages;
	}
	/**
	 * Adds a (RoomName, ReasonWhyLocked) pair to the list of locked passages for a room.
	 * @param passage the passage of the room
	 * @param whyLocked the reason for lock
	 */
	public void addLockedPassage(Room passage, String whyLocked){
    	lockedPassages.put(passage, whyLocked);
	}
	
	/**
	 * If it finds the Item "itemName" in the Room's items, 
	 * it returns that Item. Otherwise it returns null 
	 * @param item
	 * @return
	 */
	public Item findItem(String item){
    	Iterator<Item> itemItr = items.iterator();
    	while (itemItr.hasNext()) {
			Item tmpItem = (Item) itemItr.next();
			if(tmpItem.getName().equals(item)){
				return tmpItem;
			}
		}
    	
    	return null;
	}
	
/**
 * Adds an the "item" to the Room's items. Duplicate items are not allowed. 
 * Java Sets do not allow duplicate items to be added. 
 * Hence we use a Set to store the items in the Room. 
 * Returns true if item is added, returns false otherwise
 * @param item
 * @return
 */
	public boolean addItem(Item item){
    	return items.add(item);
	}
	
	/**
	 * Removes the "item" from the Rooms Set of items. 
	 * Returns true if item was removed, false otherwise.
	 * @param item
	 * @return
	 */
	public boolean removeItem(Item item){
    	return items.remove(item);
	}

	/***
	 * Receives messages from items used by the player and executes the 
	 * appropriate action stored in a message handler
	 * @param message is the "message" sent by the item
	 * @return null, this Room or Unlocked Room depending on MessageHandler
	 * DO NOT MODIFY THIS METHOD
	 */
	public Room receiveMessage(String message){
		Iterator<MessageHandler> itr = handlers.iterator();
		MessageHandler msg = null;
		while(itr.hasNext()){
			msg = itr.next();
			if(msg.getExpectedMessage().equalsIgnoreCase(message))
				break;
			msg = null;
		}
		if(msg == null)
			return null;
		switch(msg.getType()){
		case("visibility") :
			this.visibility = true;
			return this;
		case("habitability") :
			this.habitability = true;
			return this;
		case("room") :
			for(Room rm : this.lockedPassages.keySet()){
				if(rm.getName().equalsIgnoreCase(msg.getRoomName())){
					this.lockedPassages.remove(rm);
					return rm;
				}
			}
		default:
			return null;
		}
	}

	@Override
	//Returns a String consisting of the Rooms name, its description,
	//its items and locked rooms.
	// DO NOT MODIFY THIS METHOD
	public String toString(){
		StringBuilder sb = new StringBuilder();
		sb.append("Welcome to the " + name + "!");
		sb.append(System.getProperty("line.separator"));
		if(!this.visibility){
			sb.append("Its too dark to see a thing!");
			sb.append(System.getProperty("line.separator"));
			sb.append("Places that can be reached from here :");
			sb.append(System.getProperty("line.separator"));
			for(Room rm :this.lockedPassages.keySet()){
				sb.append(rm.getName());
				sb.append(System.getProperty("line.separator"));
			}
			return sb.toString();
		}
		sb.append(description);
		sb.append(System.getProperty("line.separator"));
		if(this.items.size() >0){ 
			sb.append("Some things that stand out from the rest :");
			sb.append(System.getProperty("line.separator"));
		}
		Iterator<Item> itr = this.items.iterator();
		while(itr.hasNext()){
			sb.append(itr.next().getName());
			sb.append(System.getProperty("line.separator"));
		}
		sb.append("Places that can be reached from here :");
		sb.append(System.getProperty("line.separator"));
		for(Room rm :this.lockedPassages.keySet()){
			sb.append(rm.getName());
			sb.append(System.getProperty("line.separator"));
		}
		return sb.toString();
	}
}

