member1(E,[E|_Xs]).
member1(E, [_Y|Xs]) :- member1(E,Xs).


%subset
subset1([],_Xs).
subset1([Y|Ys], Xs) :- member1(Y,Xs), subset1(Ys,Xs).

% example for the number 3  natural_number(s(s(s(0)))).
natural_number(0).
natural_number(s(X)) :- natural_number(X).

plus1(0,X,X):- natural_number(X).
plus1(s(X),Y,s(Z)) :- plus1(X,Y,Z).

% reverse check if L1 is the reverse of L2


reverse2(L1,L2):- reverse_aux(L1,L2,[]).

reverse_aux([],L2,L2).
reverse_aux([X|L1],L2,L3):- reverse_aux(L1,L2,[X|L3]).

append1([],Ys,Ys).
append1([X|Xs],Ys,[X|Zs]) :- append1(Xs,Ys,Zs).

reverse1([],[]).
reverse1([X|Xs],Zs) :- reverse1(Xs,Ys), append1(Ys,[X],Zs).



times1(0,_X,0).
times1(s(X),Y,Z) :- times1(X,Y,XY), plus1(XY,Y,Z).

power1(X,0,s(0)).
power1(0,Y,0).
power1(s(X),Y,Z):- power(X,Y,XY), times1(XY,Y,Z).


suffix(Xs,Xs).
suffix(Xs,[_Y|Ys]) :-  suffix(Xs,Ys).

subset2(Xs,[]).
subset2(Xs,[Y|Ys]):- member(Y,Xs), subset2(Xs,Ys).

inters([],Ys,[]).
inters([X|Xs],Ys,[Y|Z]) :- member(X,Ys), inter(Xs,Ys,[X|Z]).    %if member fail, go to the third line.
inters([_X|Xs], Ys, Z) :- inters(Xs,Ys,Z).

/* Directed graph */

arc(a,b).  arc(a,c).  arc(b,d).
arc(c,d).   arc(f,g).
%adding a cycle in the KB
arc(d,a).
arc(d,e).


/* Transitive closure of the relation arc */

connected(Node,Node).
connected(NodeA,NodeB) :- arc(NodeA,Z), connected(Z,NodeB).

dfs(Node,Node,[Node]).
dfs(A,B,[A|Z])  :- arc(A,X), dfs(X,B,Z).

%dfs cyclic graph, dfs  with tracing of the visited nodes

not_member(X,[]).
not_member(X,[Y|L]):- X\==Y, not_member(X,L).

dfs2(A,B,Z) :- dfs_nc(A,B,Z,_L).

dfs_nc(Node,Node,[Node],_L).
dfs_nc(A,B,[A|Z],L)  :- arc(A,X), not_member(X,L),dfs_nc(X,B,Z,[X|L]).

%insertion sort


get_minimum([Z],Z).
get_minimum([X,Y|L],Z) :- X=<Y, get_minimum([X|L],Z).
get_minimum([_X,Y|L],Z) :- get_minimum([Y|L],Z).

remove_elem(_,[],[]).
remove_elem(X,[X|L],L).
remove_elem(X,[Y|L],[Y|Z]):- remove_elem(X,L,Z).


insertion_sort2([],_Z).
insertion_sort2([Y],[Y]).
insertion_sort2(L,[Min|Z]) :- get_minimum(L,Min), remove_elem(Min,L,A), insertion_sort2(A,Z).

insertion_sort3([],_Z).
insertion_sort3([Y],[Y]).
insertion_sort3(L,Z) :- get_minimum(L,Min), remove_elem(Min,L,A), insertion_sort3(A,[Min|Z]).

% sorting by professor nardi

sort1(Xs,Ys) :- permutation(Xs,Ys), ordered(Ys).

permutation1(Xs,[Z|Zs]) :- select1(Z,Xs,Ys), permutation1(Ys,Zs).
permutation1([],[]).

ordered([]).
ordered([_X]).
ordered([X,Y|Ys]) :- X=<Y, ordered([Y|Ys]).

select1(X,[X|Xs], Xs).
select1(X,[Y|Ys], [Y,Zs]) :- select1(X,Ys,Zs).





%append(X,L,[X|L]).



alberobin(tree(a,tree(b,tree(d,void,void),tree(e,void,void)),
               tree(c,tree(f,void,void),tree(g,void,void)))).




preorder(tree(X,void,void),[X]).  %same as dfs
preorder(tree(Node,Left,Right),Z):-
    preorder(Left,LeftZ),
    preorder(Right,RightZ),
    append([Node|LeftZ],RightZ,Z).

inorder(tree(X,void,void),[X]).
inorder(tree(Node,Left,Right),Z):-
    inorder(Left,LeftZ),
    inorder(Right,RightZ),
    append(LeftZ,[Node|RightZ],Z).


postorder(tree(X,void,void),[X]).
postorder(tree(Node,Left,Right),Z):-
    postorder(Right,RightZ),
    postorder(Left,LeftZ),
    append(RightZ,[LeftZ|Node],Z).



bfs([],[]).
bfs([void|Rest],Z) :- bfs(Rest,Z).
bfs([tree(Node,Left,Right)|Rest],[Node|Z]):-
    append(Rest,[Left,Right],Nodes),
    bfs(Nodes,Z).













