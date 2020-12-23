/* Directed graph */

    arc(a,b).  arc(a,c).  arc(b,d).
    arc(c,d).  arc(d,e).  arc(f,g).

/* Transitive closure of the relation arc */

/*
 *   connected(Node1,Node2) is true when Node1 connected to Node2 
 */

    connected(Node,Node).
    connected(Node1,Node2) :- arc(Node1,NodeInt),
                             connected(NodeInt,Node2).
