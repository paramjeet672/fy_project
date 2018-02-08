/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package graph.algo;

/**
 *
 * @author java4
 */
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

/**
 * Graph object which maps vertex with nodes
 *
 * @author Siddheshwar
 *
 * @param <V>
 */
public class Graph<V> {
    // Vertex i.e. V gets mapped to list of all connecting Nodes. 

    Map<V, List<Node<V>>> adjacencyList;
    String letters = "0123456789";
    int verticesCount;
    int PIN = 3;
    int edgeCount;

    public Graph() {
        super();
//        this.adjacencyList = new HashMap<>();
    }

    /**
     * Add a new node for the given vertex. Vertex to node connection forms
     * Edge.
     *
     * @param vertex
     * @param node
     */
    public void addNewNode(V vertex, Node<V> node) {
        List<Node<V>> nodes = adjacencyList.get(vertex);
        if (nodes == null || nodes.isEmpty()) {
            nodes = new ArrayList<Node<V>>();
            nodes.add(node);
        } else {
            nodes.add(node);
        }
        adjacencyList.put(vertex, nodes);
    }

    /**
     * Takes two vertices and checks if there is a path between v1 and v2.
     * Doesn't take vice-versa.
     *
     * @param v1 first vertex
     * @param v2 second vertex
     * @return
     */
    public boolean hasRelationship(V v1, V v2) {
        if (v1 == null && v2 == null) {
            return true;
        }
        if (v1 != null && v2 == null) {
            return true;
        }
        if (v1 == null && v2 != null) {
            return false;
        }

        List<Node<V>> nodes = null;

        if (adjacencyList.containsKey(v1)) {
            nodes = adjacencyList.get(v1);
            if (nodes != null || !nodes.isEmpty()) {
                for (Node<V> v : nodes) {
                    if (v.getName().equals(v2)) {
                        return true;
                    }
                }
            }
        }
        return false;
    }

    public String GraphValues() {
        Random grval = new SecureRandom();

        String uid = "";
        for (int i = 0; i < PIN; i++) {
            int index = (int) (grval.nextDouble() * letters.length());
            uid += letters.substring(index, index + 1);
        }
        String str = "0." + uid;
        return str;
    }

    public void print() {
        System.out.println("Graph is --->");
        for (V v : adjacencyList.keySet()) {
            System.out.println(v + " --- " + adjacencyList.get(v));
        }
    }
    public String GraphGen() {
        Random grval = new SecureRandom();

        String dsf = "";
        for (int i = 0; i < PIN; i++) {
            int index = (int) (grval.nextDouble() * letters.length());
            dsf += letters.substring(index, index + 1);
        }
        String str = "0." + dsf;
        return str;
    }

    //Test method
    public static void main(String[] args) {
        Graph<String> graph = new Graph<String>();
        graph.addNewNode("Bangalore", new Node<String>("SFO", 100));
        graph.addNewNode("Bangalore", new Node<String>("HongKong", 50));
        graph.addNewNode("Bangalore", new Node<String>("LA", 70));
        graph.addNewNode("LA", new Node<String>("SFO", 20));
        graph.addNewNode("HongKong", new Node<String>("LA", 60));

        graph.print();

        System.out.println(" Path between Bangalore and LA exists ? :"
                + graph.hasRelationship("Bangalore", "LA"));
    }
}
