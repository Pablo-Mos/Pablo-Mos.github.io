import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Queue;
import java.util.HashSet;
import java.util.ArrayList;
import java.util.PriorityQueue;
import java.util.HashMap;

/**
 * Your implementation of various graph algorithms.
 *
 * @author Pablo Moschcovich
 * @version 1.0
 * @userid pherrera30
 * @GTID 903615795
 *
 * Collaborators: LIST ALL COLLABORATORS YOU WORKED WITH HERE
 *
 * Resources: LIST ALL NON-COURSE RESOURCES YOU CONSULTED HERE
 */
public class GraphAlgorithms {

    /**
     * Performs a depth first search (dfs) on the input graph, starting at
     * the parameterized starting vertex.
     *
     * When exploring a vertex, explore in the order of neighbors returned by
     * the adjacency list. Failure to do so may cause you to lose points.
     *
     * NOTE: You MUST implement this method recursively, or else you will lose
     * all points for this method.
     *
     * You may import/use java.util.Set, java.util.List, and
     * any classes that implement the aforementioned interfaces, as long as they
     * are efficient.
     *
     * The only instance of java.util.Map that you may use is the
     * adjacency list from graph. DO NOT create new instances of Map
     * for DFS (storing the adjacency list in a variable is fine).
     *
     * DO NOT modify the structure of the graph. The graph should be unmodified
     * after this method terminates.
     *
     * @param <T>   the generic typing of the data
     * @param start the vertex to begin the dfs on
     * @param graph the graph to search through
     * @return list of vertices in visited order
     * @throws IllegalArgumentException if any input is null, or if start
     *                                  doesn't exist in the graph
     */
    public static <T> List<Vertex<T>> dfs(Vertex<T> start, Graph<T> graph) {
        if (graph == null) {
            throw new IllegalArgumentException("The graph is null");
        }
        if (start == null) {
            throw new IllegalArgumentException("The start is null");
        }
        Map<Vertex<T>, List<VertexDistance<T>>> vertlist
                = graph.getAdjList();
        if (!vertlist.containsKey(start)) {
            throw new IllegalArgumentException(
                    "The start vertex is not in the list");
        }
        List<Vertex<T>> result = new ArrayList<>();
        Set<Vertex<T>> visited = new HashSet<>();
        depthFirstSearchHelper(start, visited, result, vertlist);
        return result;
    }

    /**
     * Actual method for dfs
     *
     * @param start start
     * @param visited set of visited vertices
     * @param result result output
     * @param vertexList vertex list
     * @param <T> data type
     */
    private static <T> void depthFirstSearchHelper(Vertex<T>
                                                         start, Set<Vertex<T>> visited,
                                                 List<Vertex<T>> result,
                                                 Map<Vertex<T>, List<VertexDistance<T>>> vertexList) {
        result.add(start);
        visited.add(start);
        for (VertexDistance<T> vertex: vertexList.get(start)) {
            if (!visited.contains(vertex.getVertex())) {
                depthFirstSearchHelper(vertex.getVertex(), visited,
                        result, vertexList);
            }
        }
    }

    /**
     * Finds the single-source shortest distance between the start vertex and
     * all vertices given a weighted graph (you may assume non-negative edge
     * weights).
     *
     * Return a map of the shortest distances such that the key of each entry
     * is a node in the graph and the value for the key is the shortest distance
     * to that node from start, or Integer.MAX_VALUE (representing
     * infinity) if no path exists.
     *
     * You may import/use java.util.PriorityQueue,
     * java.util.Map, and java.util.Set and any class that
     * implements the aforementioned interfaces, as long as your use of it
     * is efficient as possible.
     *
     * You should implement the version of Dijkstra's where you use two
     * termination conditions in conjunction.
     *
     * 1) Check if all of the vertices have been visited.
     * 2) Check if the PQ is empty yet.
     *
     * DO NOT modify the structure of the graph. The graph should be unmodified
     * after this method terminates.
     *
     * @param <T>   the generic typing of the data
     * @param start the vertex to begin the Dijkstra's on (source)
     * @param graph the graph we are applying Dijkstra's to
     * @return a map of the shortest distances from start to every
     * other node in the graph
     * @throws IllegalArgumentException if any input is null, or if start
     *                                  doesn't exist in the graph.
     */
    public static <T> Map<Vertex<T>, Integer> dijkstras(Vertex<T> start,
                                                        Graph<T> graph) {
        if (start == null || graph == null) {
            throw new IllegalArgumentException(
                    "The start and graph cannot be null");
        }
        Map<Vertex<T>, List<VertexDistance<T>>> vertexList =
                graph.getAdjList();
        if (!graph.getAdjList().containsKey(start)) {
            throw new IllegalArgumentException(
                    "The start must be in the adjacency list");
        }
        Set<Vertex<T>> visited = new HashSet<>();
        Queue<VertexDistance<T>> queue = new PriorityQueue<>();
        Map<Vertex<T>, Integer> ret = new HashMap<>();
        for (Vertex<T> vertex : vertexList.keySet()) {
            if (vertex.equals(start)) {
                ret.put(vertex, 0);
            } else {
                ret.put(vertex, Integer.MAX_VALUE);
            }
        }
        queue.add(new VertexDistance<>(start, 0));
        while (!queue.isEmpty() && !visited.equals(vertexList.keySet())) {
            VertexDistance<T> vP = queue.remove();
            visited.add(vP.getVertex());
            for (VertexDistance<T> add
                    : vertexList.get(vP.getVertex())) {
                int newDist = add.getDistance() +  vP.getDistance();
                if (newDist < ret.get(add.getVertex())) {
                    VertexDistance<T> newPair =
                            new VertexDistance<>(add.getVertex(), newDist);
                    queue.add(newPair);
                    ret.put(add.getVertex(), newDist);
                }
            }
        }
        return ret;
    }

    /**
     * Runs Prim's algorithm on the given graph and returns the Minimum
     * Spanning Tree (MST) in the form of a set of Edges. If the graph is
     * disconnected and therefore no valid MST exists, return null.
     *
     * You may assume that the passed in graph is undirected. In this framework,
     * this means that if (u, v, 3) is in the graph, then the opposite edge
     * (v, u, 3) will also be in the graph, though as a separate Edge object.
     *
     * The returned set of edges should form an undirected graph. This means
     * that every time you add an edge to your return set, you should add the
     * reverse edge to the set as well. This is for testing purposes. This
     * reverse edge does not need to be the one from the graph itself; you can
     * just make a new edge object representing the reverse edge.
     *
     * You may assume that there will only be one valid MST that can be formed.
     *
     * You should NOT allow self-loops or parallel edges in the MST.
     *
     * You may import/use java.util.PriorityQueue, java.util.Set, and any
     * class that implements the aforementioned interface.
     *
     * DO NOT modify the structure of the graph. The graph should be unmodified
     * after this method terminates.
     *
     * The only instance of java.util.Map that you may use is the adjacency
     * list from graph. DO NOT create new instances of Map for this method
     * (storing the adjacency list in a variable is fine).
     *
     * @param <T>   the generic typing of the data
     * @param start the vertex to begin Prims on
     * @param graph the graph we are applying Prims to
     * @return the MST of the graph or null if there is no valid MST
     * @throws IllegalArgumentException if any input is null, or if start
     *                                  doesn't exist in the graph
     */
    public static <T> Set<Edge<T>> prims(Vertex<T> start, Graph<T> graph) {
        if (start == null) {
            throw new IllegalArgumentException("The start vertex cannot be null");
        }
        if (graph == null) {
            throw new IllegalArgumentException("The graph cannot be null");
        }
        if (!graph.getVertices().contains(start)) {
            throw new IllegalArgumentException("The "
                    + "start vertex is not in the graph");
        }
        Set<Edge<T>> retSet = new HashSet<>();
        Queue<Edge<T>> queue = new PriorityQueue<>();
        Set<Vertex<T>> visitedSet = new HashSet<>();
        Map<Vertex<T>, List<VertexDistance<T>>> vMap = graph.getAdjList();

        for (VertexDistance<T> v: vMap.get(start)) {
            queue.add(new Edge<>(start, v.getVertex(), v.getDistance()));
        }
        visitedSet.add(start);
        while (!queue.isEmpty()
                && !(visitedSet.size() == graph.getVertices().size())) {
            Edge<T> currEdge = queue.remove();
            if (!visitedSet.contains(currEdge.getV())) {
                visitedSet.add(currEdge.getV());
                retSet.add(new Edge<>(currEdge.getU(), currEdge.getV(),
                        currEdge.getWeight()));
                retSet.add(new Edge<>(currEdge.getV(), currEdge.getU(),
                        currEdge.getWeight()));
                for (VertexDistance<T> v: vMap.get(currEdge.getV())) {
                    if (!visitedSet.contains(v.getVertex())) {
                        queue.add(new Edge<>(currEdge.getV(), v.getVertex(),
                                v.getDistance()));
                    }
                }
            }
        }
        if ((retSet.size() / 2) == graph.getVertices().size() - 1) {
            return retSet;
        } else {
            return null;
        }
    }
}
