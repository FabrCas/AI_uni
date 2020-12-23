arc(a,b).  arc(a,c).  arc(b,d). arc(d,a).
arc(c,d).  arc(d,e).  arc(f,g).

path(Nodo,Nodo,[]).
path(X,Nodo2,[X|L]) :- arc(X,NodoInt),
                          path(NodoInt,Nodo2,L).

path(X,Y) :- cyclicPath(X,Y,[X]).

cyclicPath(X,X,_Visitato).

cyclicPath(X,Y,Visitato) :- arc(X,N),
	not(member(N,Visitato)),
	cyclicPath(N,Y,[N|Visitato]).


listTest([1,2,3]).

insert(X, [], [X]).
insert(X, [Y|Ys], [Y|Zs]):- X>Y, !, insert(X, Ys, Zs).
insert(X, [Y|Ys], [X,Y|Ys]):- X=<Y, !.

insert1(X, [], [X]).
insert1(X, [Y|Ys], [Y|Zs]):- X>Y, insert1(X, Ys, Zs).
insert1(X, [Y|Ys], [X,Y|Ys]):- X=<Y.

iSort([],[]).
iSort([X|Xs], Ys):-iSort(Xs, Zs), insert(X, Zs, Ys).

sort2(Xs,Xs) :- ordered(Xs).
sort2(Xs,Ys) :- append1(As,[X,Y|Bs],Xs), X > Y,
                         append1(As,[Y,X|Bs],Xs1),
                         sort2(Xs1,Ys).

ordered([]).
ordered([_X]).
ordered([X,Y|Ys]) :- X =< Y, ordered([Y|Ys]).

sort1(Xs,Ys) :- permutation(Xs,Ys), ordered(Ys).

permutation(Xs,[Z|Zs]) :- select1(Z,Xs,Ys), permutation(Ys,Zs).
permutation([],[]).

select1(X,[X|Xs],Xs).
select1(X,[Y|Ys],[Y|Zs]) :- select1(X,Ys,Zs).


