
public class Item {
	// name of item
	private String	name;
	// description of item
	private String	description;
	private boolean activated;
	private String message;
	private boolean oneTimeUse;
	private String usedString;
	
	//TODO add remaining private data members
	
	/**
	 * Constructor for the item.
	 * If activated is true, the item is active and has been used. If oneTimeUse is true, the item can be used only once.
	 * Throw an IllegalArgumentException if parameters are missing or invalid
	 * @param name
	 * @param description
	 * @param activated
	 * @param message
	 * @param oneTimeUse
	 * @param usedString
	 */
	public Item(String name, String description, boolean activated, 
			String message,boolean oneTimeUse, String usedString){
		if (name == null || description == null || message == null || usedString == null){
			throw new IllegalArgumentException();
		}
		
    	this.name = name;
    	this.description = description;
    	this.activated = activated;
    	this.message = message;
    	this.oneTimeUse = oneTimeUse;
    	this.usedString = usedString;
	}
	
	public String getName(){
		return name;
	}
	
	public String getDescription(){
    	return description;
	}
	
	public boolean activated(){
    	return activated;
	}
	
	/**
	 * Returns the "message" that the item wants to send to the room.
	 * 	 This is used in the notifyRoom() function in TheGame class
	 * @return
	 */
	public String on_use(){
    	return message;
	}
	
	/**
	 * Activates the object. This changes the activation status to true.
	 */
	public void activate(){
    	activated = true;
	}
	
	/**
	 * Returns the "on_useString" for the Item. This is printed in the 
	 * notifyRoom() function in TheGame class after an item has been used and is active.
	 * @return
	 */
	public String on_useString(){
    	return usedString;
	}
	
	/**
	 * Returns true if the item can only be used once. Else returns false. 
	 * This is used in TheGame to remove single-time use items after they are used
	 * @return
	 */
	public boolean isOneTimeUse(){
		return oneTimeUse;
	}

	@Override
	//This returns a String consisting of the name and description of the Item
	//This has been done for you.
	//DO NOT MODIFY
	public String toString(){
		StringBuilder sb = new StringBuilder();
		sb.append("Item Name: " + this.name);
		sb.append(System.getProperty("line.separator"));
		sb.append("Description: " + this.description);
		return sb.toString();
	}
}
