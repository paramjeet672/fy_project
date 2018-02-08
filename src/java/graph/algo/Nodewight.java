/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package graph.algo;

import java.security.SecureRandom;
import java.util.List;
import java.util.Map;
import java.util.Random;

/**
 *
 * @author java4
 */
public class Nodewight {

    static final int V = 4;
    String getNode = null;
    static final int INF = Integer.MAX_VALUE;
    String nodeval1 = "";
    String letters = "0123456789";
    int verticesCount;
    String Weight = "";
    int floatLength = 4;
    int len = 1;
    String NodeWeight = "";
    int edgeCount;
    int weight;
    private int[][] graph;

    public void Node(String name, int weight) {

        this.getNode = name;
        this.weight = weight;
        
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

    public String getNodeWeight(String Nodevalue) {

        getNode = Nodevalue;
        System.out.println("Get Nodes : " + getNode);
        Random grval = new SecureRandom();


        for (int i = 0; i < floatLength; i++) {
            int index = (int) (grval.nextDouble() * letters.length());
            Weight += letters.substring(index, index + 1);
        }
        NodeWeight = nodeval1 + "." + Weight;
        System.out.println("Get Node Weighting : " + NodeWeight);
        return NodeWeight;
    }
}
