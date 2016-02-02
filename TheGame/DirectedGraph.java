import java.io.StringWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;

public class DirectedGraph<V> implements GraphADT<V>{
	private HashMap<V, ArrayList<V>> hashmap;
    //DO NOT ADD ANY OTHER DATA MEMBERS

    public DirectedGraph() {
    	hashmap = new HashMap<V,ArrayList<V>>();
    	
    }

    public DirectedGraph(HashMap<V, ArrayList<V>> hashmap) {
    	this.hashmap = hashmap;
    }

    @Override
    /** Adds the specified vertex to this graph if not already present. More 
	 * formally, adds the specified vertex v to this graph if this graph 
	 * contains no vertex u such that u.equals(v). If this graph already 
	 * contains such vertex, the call leaves this graph unchanged and returns false.
	 * @param vertex
	 * @return
	 */
    public boolean addVertex(V vertex) {
		
    	//add the vertex to the hashmap as key
    	if(hashmap.containsKey(vertex)){
    		return false;
    	}
    	hashmap.put(vertex, new ArrayList<V>());
		return true;
    }

    @Override
    /**
     * Creates a new edge from vertex v1 to v2 and returns true, 
     * if v1.equals(v2) evaluates to false and an edge does not already exist 
     * from v1 and v2. Returns false otherwise. 
 	* Vertices v1 and v2 must already exist in this graph. If they are not found in 
 	* the graph IllegalArgumentException is thrown.
     * @param v1 
     * @param v2
     * @return
     */
    public boolean addEdge(V v1, V v2) {
    	
    	//if v1 or v2 is not in the graph
    	if(!(hashmap.containsKey(v1) && hashmap.containsKey(v2))){
    		throw new IllegalArgumentException();
    	}
    	
    	//if v1 = v2
    	if(v1.equals(v2)){
    		return false;
    	}
    	
    	ArrayList<V> adjListForV1 = hashmap.get(v1);
    	
    	//there already exists an edge from v1 -> v2
    	if(adjListForV1.contains(v2)){
    		return false;
    	}
    	//add v2 to v1 adjacent list
    	adjListForV1.add(v2);
    	return true;
    }

    @Override
    /**
     * Returns a set of all vertices to which v has outward edges. 
 	* Vertex v must already exist in this graph. If it is not found in the graph 
 	* IllegalArgumentException is thrown
     * @param vertex
     * @return
     */
    public Set<V> getNeighbors(V vertex) {
    	ArrayList<V> adjList  = hashmap.get(vertex);
    	return new HashSet<V>(adjList);
    }

    @Override
    /**If both v1 and v2 exist in the graph, and an edge exists from v1 to v2, 
     * remove the edge from this graph. Otherwise, do nothing.
     * 
     * @param v1
     * @param v2
     */
    public void removeEdge(V v1, V v2) {
    	if(hashmap.containsKey(v1)){
    		hashmap.get(v1).remove(v2);
    	}
    }

    @Override
    /**
     * Returns a set of all the vertices in the graph.
     * @return
     */
    public Set<V> getAllVertices() {
		
		return hashmap.keySet();
    }

    @Override
    //Returns a String that depicts the Structure of the Graph
    //This prints the adjacency list
    //This has been done for you
    //DO NOT MODIFY
    public String toString() {
        StringWriter writer = new StringWriter();
        for (V vertex: this.hashmap.keySet()) {
            writer.append(vertex + " -> " + hashmap.get(vertex) + "\n");
        }
        return writer.toString();
    }

}
