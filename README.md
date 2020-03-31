## N-hop Graph Neighborhood Computation

### Information

**Problem** 

Given a Graph, *G = (V,E)* (directed or undirected), compute the N-hop neighborhoods of the nodes in a given graph

**Approach**

Nothing magical. Straight-forward exhaustive computation. No attempt is made to make it parallel. However, it is easy to make the program parallel by using MATLAB's already available parallelisation toolbox and *parfor* loops (carefully do this!).

### Inputs 

***Adjacency list file***

A text file containing the *adjacency list* representation of the graph *G*. Each row in the file contains the following information

*(v_i, v_j, dist(v_i,v_j))*

where, *v_{i,j}* are vertices from the set *V*, *dist(v_i,v_j)* is the distance between the two vertices. Ideally, the input contains the 1-distanced edges. So, the last column of the file is always 1. One may think that this is not very necessary. But, for the usage of this was there in my work that uses this neighborhood computation function and therefore, I have kept it. 

Further, one may also input an *adjacency matrix* of *G*. But, this has to be then taken care in the program itself. Just simple nested for-loop type code within the function will do the job. I leave it to anyone who uses my program.

Also note that: My program considers the graph is **undirected**. If if the adjacency list contains the edges (1,2,1), that should mean that (2,1,1) is also TRUE. If you are going to use this program for a directed graph, change the line of the program that is **commented** saying *%comment out this statement if your input graph is directed*.

***Neighborhood size (N) in N-hop***

This is a positive integer. There is nothign called a 0-hop neighborhood -- this is taken care in the program.


### Examples

**Example 1**

A linear graph with 10 vertices, 1 - 2 - 3 - ... - 9 - 10. The input is given in the file input10.dat. The neighborhood computation for **all** the nodes in the graph takes only a few seconds.

**Example 2**

A complex graph with 5000 vertices. The input file for this graph is given in input5000.dat. The neighborhood computation for this graph are (N=1, T=3.5s), (N=2, T=407s) on a machine with Quad-Core Intel Core i5 (each processor core with 2.5GHz) with 4GB RAM.
