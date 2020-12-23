/*
 ******************************************************************************
 * Relazioni di parentela -- Ricorsione
 ******************************************************************************
 */

father(daniele,michela).
father(daniele,jacopo).
father(marcello,lorenzo).
father(eriberto,daniele).
father(eriberto,marcello).
father(eriberto,sandro).
father(antonio,eriberto).
father(antonio,arcangelo).

mother(alma,eriberto).
mother(alma,arcangelo).
mother(annamaria,daniele).
mother(annamaria,marcello).
mother(annamaria,sandro).
mother(rosi,lorenzo).
mother(anna,michela).
mother(anna,jacopo).

nice(michela).
nice(anna).

male(daniele).
male(jacopo).
male(lorenzo).
male(andrea).
male(marcello).
male(sandro).
male(eriberto).
male(arcangelo).
male(antonio).

fem(michela).
fem(rosi).
fem(anna).
fem(annamaria).
fem(alma).

/* ? nice(X) */

grandfather(X,Z) :- father(X,Y), father(Y,Z).
grandfather(X,Z) :- father(X,Y), mother(Y,Z).

grandfather1(X,Z) :- father(X,Y), mother(Y,Z).
grandfather1(X,Z) :- father(X,Y), father(Y,Z).

grandfather2(X,Z) :- mother(Y,Z), father(X,Y).
grandfather2(X,Z) :- father(Y,Z), father(X,Y).

/* ? grandfather(antonio,X) */
/* ? grandfather(X,jacopo) */

parent(X,Y) :- father(X,Y).
parent(X,Y) :- mother(X,Y).

gp(X,Z) :- parent(X,Y), parent(Y,Z).

/* ? gp(X,daniele) */

daughter(X,Y):-mother(Y,X),fem(X).
daughter(X,Y):-father(Y,X),fem(X).

siblings(S1,S2):- parent(X,S1), parent(X,S2), S1 \== S2.

/* ? daughter(X,Y) */

brother(X,Y) :- son(X,Z), son(Y,Z), X \= Y.
/* brother(X,Y) :- son(X,Z), daughter(Y,Z). */

cousin(C1,C2) :- son(C1,G1), son(C2,G2), 
                 brother(G1,G2).

son(X,Y):-mother(Y,X).
son(X,Y):-father(Y,X).

descendant(X,Y):-son(X,Y).
descendant(X,Y):-son(Z,Y), descendant(X,Z).

/* esercise 2 */

descendant1(X,Y):-son(X,Y).
descendant1(X,Y):-descendant1(X,Z), son(Z,Y).

descendant2(X,Y):-son(Z,Y), descendant2(X,Z).
descendant2(X,Y):-son(X,Y).

descendant3(X,Y):-descendant3(X,Z), son(Z,Y).
descendant3(X,Y):-son(X,Y).


sG(X,X).
sG(X,Y):- parent(Z,X),sG(Z,W),parent(W,Y).
