%kb
father(marco,fabrizio).
father(marco,loris).
mother(laura,fabrizio).
mother(laura,loris).
uncle(giorgio, fabrizio).
aunt(raffaella,fabrizio).
father(umberto,laura).
male(fabrizio).
male(loris).




grandfather(X,Y) :- father(X,Z), son(Y,Z).  %x grandfather of y, male entity
%same thing
grandfather2(X,Y) :- father(X,Z), father(Z,Y).
grandfather2(X,Y) :- father(X,Z), mother(Z,Y).


son(X,Y) :- father(Y,X).  %x son of y
son(X,Y) :- mother(Y,X).

nephew(X,Y) :-  male(X), aunt(Y,X).
nephew(X,Y) :-  male(X), uncle(Y,X).
nephew(X,Y) :-  male(X), grandfather(Y,X).

descendant(X,Y) :- son(X,Y).
descendant(X,Y) :- son(X,Z), descendant(Z,Y).

sibling(X,Y) :-  father(Z,X), father(Z,Y), X\==Y.

parent(X,Y) :- father(X,Y).
parent(X,Y) :- mother(X,Y).

same_gen(X,X).
same_gen(X,Y) :-  parent(Z,X),same_gen(Z,V), parent(V,Y), X\==Y.

