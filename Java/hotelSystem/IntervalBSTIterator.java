///////////////////////////////////////////////////////////////////////////////
//                   ALL STUDENTS COMPLETE THESE SECTIONS
// Main Class File:  Scheduler.java
// Files:            IntervalBSTIterator.java
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
import java.util.*;
/**
 * 
 * @author Zonglin Han
 *
 * @param <K>
 */
public class IntervalBSTIterator<K extends Interval> implements Iterator<K> {

	private Stack<IntervalBSTnode<K>> stack; //for keeping track of nodes
	
	/**
	 * initialize the interator
	 * 
	 * @param root the root of the tree
	 */
	public IntervalBSTIterator(IntervalBSTnode<K> root) {
		stack = new Stack<IntervalBSTnode<K>>();
		// call a helping method to push the element into stack in right order
         addInOrder(stack, root); 
	} 
	/**
     * check if there is a BST tree node next
     */
    public boolean hasNext() {
		return !stack.isEmpty();
    }

    /**
     * get the next BST tree node
     */
    public K next() {
		return stack.pop().getData();
    }

    public void remove() {
        // DO NOT CHANGE: you do not need to implement this method
        throw new UnsupportedOperationException();
    }
    /**
     * put treenode in order in a stack
     * 
     * @param stack , the stack that will store the element of the tree
     * @param root, the root of the tree
     */
    private void addInOrder(Stack<IntervalBSTnode<K>> stack, IntervalBSTnode<K> root)
    {
    	
    	if(root == null) // base case, stop pushing element 
    	{
    		return;
    	}
    	else
    	{
    		addInOrder(stack, root.getRight()); 
    		stack.push(root);
    		addInOrder(stack, root.getLeft());
    		// push the right-most element in the tree first, the push the element in order of right to left by this recursive call
     	}
    	
    }
}