/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package graph.algo;

/**
 *
 * @author java4
 */
public class Vertex<V> {

    private V name;

    public Vertex(V name) {
        super();
        this.name = name;
    }

    public V getName() {
        return name;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((name == null) ? 0
                : name.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        Vertex other = (Vertex) obj;
        if (name == null) {
            if (other.name != null) {
                return false;
            }
        } else if (!name.equals(other.name)) {
            return false;
        }
        return true;
    }
}

