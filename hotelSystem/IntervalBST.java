
///////////////////////////////////////////////////////////////////////////////
//                   ALL STUDENTS COMPLETE THESE SECTIONS
// Main Class File:  Scheduler.java
// Files:            IntervalBST.java
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
import java.util.Iterator;

/**
 * implement the BST data structure
 * 
 * @author Xiaojun He
 *
 * @param <K>
 */
public class IntervalBST<K extends Interval> implements SortedListADT<K> {
	private IntervalBSTnode<K> root;
	private int size;

	/**
	 * construct a null interval tree with 0 size
	 */
	public IntervalBST() {
		root = null;
		size = 0;
	}

	/**
	 * Inserts the given key into the Sorted List.
	 * 
	 * @param key
	 *            the key value to insert into the Sorted List
	 */
	public void insert(K key) {
		root = insert(root, key);
		size++;
		fix(root);
		// need to throw duplicate exceptions?
	}

	/**
	 * delete the given key in the Sorted List.
	 * 
	 * @param key
	 *            the key value to be deleted in the Sorted List
	 * 
	 * @return the key from the Sorted List, if it is there; null if the key is
	 *         not in the Sorted List
	 */
	public boolean delete(K key) {
		if (delete(root, key)) {
			size--;
			fix(root);
			return true;
		}
		return false;

	}

	/**
	 * Searches for the given key in the Sorted List and returns it.
	 * 
	 * @param key
	 *            the key to search for
	 * 
	 * @return the key from the Sorted List, if it is there; null if the key is
	 *         not in the Sorted List
	 */
	public K lookup(K key) {
		return lookup(root, key);
	}

	/**
	 * @return the size of the tree
	 */
	public int size() {
		return this.size;
	}

	/**
	 * check if the tree is empty
	 * 
	 * @return true if tree is empty
	 */
	public boolean isEmpty() {
		return this.size == 0;
	}

	/**
	 * construct a interator for the tree
	 */
	public Iterator<K> iterator() {
		Iterator<K> temp = new IntervalBSTIterator<K>(root);
		return temp;
	}

	/**
	 * insert a node to the tree
	 * 
	 * @param root,
	 *            root of a tree
	 * @param key,
	 *            the item, which extends interval, want to be inserted
	 * @return the root of the tree
	 */
	private IntervalBSTnode<K> insert(IntervalBSTnode<K> root, K key) {
		IntervalBSTnode<K> newNode = new IntervalBSTnode<K>(key);
		// construct a node with value key
		if (root == null) {
			return newNode;
		}
		if (key.equals(root.getData()) || key.overlap(root.getData())) {
			throw new IntervalConflictException();
		}
		if (key.compareTo(root.getData()) < 0) {
			root.setLeft(insert(root.getLeft(), key));
			return root;
		} else {
			root.setRight(insert(root.getRight(), key));
			return root;
		}
	}

	/**
	 * look up a certain key in the tree
	 * 
	 * @param root:
	 *            root of the tree
	 * @param key:
	 *            the key to be looked up
	 * @return the key if it exists in the tree, null otherwise
	 */
	private K lookup(IntervalBSTnode<K> root, K key) {
		if (root == null) {
			return null;
		}

		if (((Event) key).equals(((Event) root.getKey()))) {
			return key;
		}

		if (key.compareTo(root.getKey()) < 0) {
			return lookup(root.getLeft(), key);
		}

		else {
			return lookup(root.getRight(), key);
		}
	}

	/**
	 * delete a node from the tree
	 * 
	 * @param root,
	 *            root of a tree
	 * @param key,
	 *            the item to be deleted
	 * @return true if the key is deleted
	 */
	private boolean delete(IntervalBSTnode<K> root, K key) {
		if (root == null) {
			return false;
		}

		if (((Event) key).equals(((Event) root.getKey()))) {
			if (root.getLeft() == null && root.getRight() == null) {
				root = null;
			}
			if (root.getLeft() == null) {
				IntervalBSTnode<K> right = root.getRight();
				while (right.getLeft() != null) {
					right = right.getLeft();
				}
				root = right;
				right = null;
			} else {
				IntervalBSTnode<K> left = root.getLeft();
				while (left.getRight() != null) {
					left = left.getRight();
				}
				root = left;
				left = null;
			}
			return true;
		}

		else if (key.compareTo(root.getKey()) < 0) {
			return delete(root.getLeft(), key);
		}

		else {
			return delete(root.getRight(), key);
		}
	}
	/**
	 * fix the tree's maxend property after insertion and delete
	 * @param root the root of the tree
	 */
	private void fix(IntervalBSTnode<K> root) {
		if (root == null || (root.getLeft() == null && root.getRight() == null))
			return;
		fix(root.getLeft());
		fix(root.getRight());
		if (root.getLeft() != null && root.getRight() != null) {
			root.setMaxEnd(
					Math.max(root.getMaxEnd(), Math.max(
							root.getLeft().getMaxEnd(), 
							root.getRight().getMaxEnd())));
		} else if (root.getLeft() != null && root.getRight() == null) {
			root.setMaxEnd(Math.max(root.getMaxEnd(), 
					root.getLeft().getMaxEnd()));
		} else {
			root.setMaxEnd(Math.max(root.getMaxEnd(), 
					root.getRight().getMaxEnd()));
		}
	}
}