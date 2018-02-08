/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package graph.algo;

/**
 *
 * @author java4
 */
public class Edge<V> {

    private Vertex<V> source;
    private Vertex<V> destination;
    int weight;

    public Edge(Vertex<V> source, Vertex<V> destination, int weight) {
        super();
        this.source = source;
        this.destination = destination;
        this.weight = weight;
    }

    public Vertex<V> getSource() {
        return source;
    }

    public Vertex<V> getDestination() {
        return destination;
    }

    public int getWeight() {
        return weight;
    }

    @Override
    public String toString() {
        return "Edge [source=" + source + ", destination=" + destination
                + ", weight=" + weight + "]";
    }
}
