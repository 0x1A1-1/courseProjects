import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;


public class Player {
	// player name
	private String name;
	// the magic sack held by the player that contains all his/her items
	private Set<Item> magicSack;
	//Do not add anymore private data members
	
	/**
	 * Constructs a Player Object. All parameters are required and 
	 * you should throw an IllegalArgumentException for invalid arguments.
	 * @param name
	 * @param startingItems
	 */
	public Player(String name, Set<Item> startingItems){
		this.name = name;
		this.magicSack = startingItems;
		if(name == null || startingItems == null){
			throw new IllegalArgumentException();
		}
	}
	
	/**
	 * Getter method for the Name of the player
	 * @return
	 */
	public String getName(){
    	return name;
	}
	
	//Returns a String consisting of the items in the sack
	//DO NOT MODIFY THIS METHOD
	public String printSack(){
		//neatly printed items in sack
		StringBuilder sb = new StringBuilder();
		sb.append("Scanning contents of your magic sack");
		sb.append(System.getProperty("line.separator"));
		for(Item itm : magicSack){
			sb.append(itm.getName());
			sb.append(System.getProperty("line.separator"));
		}
		return sb.toString();
	}
	
	/**
	 * Iterate through the sack, and find the items whose status is activated.
	 *  This is used in TheGame class when a user enters a new room, 
	 *  so that all active items work in the new room.
	 * @return
	 */
	public Set<Item> getActiveItems(){
		Iterator<Item> itemItr = magicSack.iterator();
		HashSet<Item> activatedSet = new HashSet<>();
		while(itemItr.hasNext()){
			Item tmpItem = itemItr.next();
			if(tmpItem.activated()){
				activatedSet.add(tmpItem);
			}
		}
		
		return activatedSet;
	}
	/**
	 * Find the Item in the sack whose name is "itemName". 
	 * Return the item if you find it, otherwise return null.
	 * @param item
	 * @return
	 */
	public Item findItem(String item){
    	Iterator<Item> itemItr = magicSack.iterator();
    	while(itemItr.hasNext()){
    		Item tmpItem = itemItr.next();
    		if(tmpItem.getName().equals(item)){
    			return tmpItem;
    		}
    	}
    	
    	return null;
    	
	}
	
	/**
	 * Checks if the player has the "item" in his sack.
	 *  Returns true if he does, otherwise returns false.
	 * @param item
	 * @return
	 */
	public boolean hasItem(Item item){
    	return magicSack.contains(item);
	}
	
	/**
	 * Adds the "item" to the Player's sack. Duplicate items are not allowed. 
	 * (Read the bullet above to see how to handle this.) 
	 * Returns true if item successfully added, else returns false.
	 * @param item
	 * @return
	 */
	public boolean addItem(Item item){
		// I assume the file will not give the duplicate name of an item
		return magicSack.add(item);
	}
	
	/**
	 * Removes the "item" from the sack. 
	 * Returns true if removal is successful, else returns false.
	 * @param item
	 * @return
	 */
	public boolean removeItem(Item item){
    	return magicSack.remove(item);
	}
}
