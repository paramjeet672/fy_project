/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package graph.algo;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.*;
import java.lang.*;
import java.io.*;
import java.security.SecureRandom;

/**
 *
 * @author java4
 */
public class Node<V> {
    
    static final int V = 4;
    String getNode = null;
    static final int INF = Integer.MAX_VALUE;
    Map<V, List<Node<V>>> adjacencyList;
    String nodeval1 = "";
    String letters = "0123456789";
    int verticesCount;
    String Weight = "";
    int floatLength = 4;
    int len = 1;
    String NodeWeight = "";
    int edgeCount;
    V name; // Vertex name
    int weight;
    private int[][] graph;
    
    int shortestPath(int graph[][], int u, int v, int k) {
        // Base cases
        if (k == 0 && u == v) {
            return 0;
        }
        if (k == 1 && graph[u][v] != INF) {
            return graph[u][v];
        }
        if (k <= 0) {
            return INF;
        }

        // Initialize result
        int res = INF;

        // Go to all adjacents of u and recur
        for (int i = 0; i < V; i++) {
            
            if (graph[u][i] != INF && u != i && v != i) {
                
                int rec_res = shortestPath(graph, i, v, k - 1);
                if (rec_res != INF) {
                    
                    res = Math.min(res, graph[u][i] + rec_res);
                }
            }
        }
        return res;
    }
    
    public Node(V name, int weight) {
        super();
        this.name = name;
        this.weight = weight;
    }
    
    public void addNodeWeight(V vertex, Node<V> node) {
        
        List<Node<V>> nodes = adjacencyList.get(vertex);
        
        if (nodes == null || nodes.isEmpty()) {
           
            //
            nodes.add(node);
        } else {
            nodes.add(node);
        }
        adjacencyList.put(vertex, nodes);
    }
    
    public String getNode() {
        Random grval = new SecureRandom();
        
        
        for (int i = 0; i < len; i++) {
            int index = (int) (grval.nextDouble() * letters.length());
            nodeval1 += letters.substring(index, index + 1);
        }
        String strf = nodeval1;
        return strf;
    }
    
    public V getName() {
        return name;
    }
    
    public String getNodeWeight(String Nodevalue) {
        
        getNode = Nodevalue;
        System.out.println("Get Nodes : " + getNode);
        Random grval = new SecureRandom();
        
        shortestPath(graph, V, V, V);
        for (int i = 0; i < floatLength; i++) {
            int index = (int) (grval.nextDouble() * letters.length());
            Weight += letters.substring(index, index + 1);
        }
        NodeWeight = nodeval1 + "." + Weight;
        return NodeWeight;
    }
    
    @Override
    public String toString() {
        return "(" + this.weight + ")" + this.name;
    }
}

