///////////////////////////////////////////////////////////////////////////////
//                   ALL STUDENTS COMPLETE THESE SECTIONS
// Main Class File:  Scheduler.java
// Files:            IntervalBSTnode.java
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
/**
 * @author Zonglin Han
 *
 * @param <K>
 */
/**
 * @author Zonglin Han
 *
 * @param <K>
 */
class IntervalBSTnode<K extends Interval> {
     private K key;
     private IntervalBSTnode<K> right;
     private IntervalBSTnode<K> left;
     private long maxEnd;
    /**
     * construct a keynode base on a value
     * 
     * @param keyValue the value (interval) of the node 
     */
    public IntervalBSTnode(K keyValue) {
		key = keyValue;
		maxEnd = keyValue.getEnd(); // not so sure
		right = null;
		left = null;
    }
    
    /**
     * construct a key node with properties
     * 
     * @param keyValue the value of the node
     * @param leftChild the left child node 
     * @param rightChild the right child node
     * @param maxEnd the latest ending time of the event
     */
    public IntervalBSTnode(K keyValue, IntervalBSTnode<K> leftChild, 
    		IntervalBSTnode<K> rightChild, long maxEnd) {
		key = keyValue;
		left = leftChild;
		right = rightChild;
		this.maxEnd = maxEnd;
    }

    /**
     * @return the interval stored in the node
     */
    public K getKey() { 
		return key;
    }
    
    /**
     * @return the left child
     */
    public IntervalBSTnode<K> getLeft() { 
		return left;
    }
  
    /**
     * @return the right child
     */
    public IntervalBSTnode<K> getRight() { 
		return right;
    }
 
    /**
     * @return the latest ending time
     */
    public long getMaxEnd(){
		return maxEnd;
    }
 
    /**
     * @param newK the new interval that would be stored
     */
    public void setKey(K newK) { 
		key = newK;
    }
    
    /**
     * @param newL the new left child
     */
    public void setLeft(IntervalBSTnode<K> newL) { 
		left = newL;
    }
    
    /**
     * @param newR the new right child
     */
    public void setRight(IntervalBSTnode<K> newR) { 
		right = newR;
    }
    
    /**
     * @param newEnd the new max ending time
     */
    public void setMaxEnd(long newEnd) { 
		//TODO Remove this exception and implement the method
		this.maxEnd = newEnd;
    }
    
    /**
     * @return the starting time of the interval that stored in the node
     */
    public long getStart(){ 
		return key.getStart();
	}

    /**
     * @return the ending time of the interval that stored in the node
     */
    public long getEnd(){
		return key.getEnd();
	}

    /**
     * @return the interval that stored in the node
     */
    public K getData(){
		return key;
	}
    
}