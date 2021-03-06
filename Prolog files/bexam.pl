pow2(0,E,0).
pow2(B,0,1).
pow2(B,E,R) :- E2 is E-1, pow2(B,E2,R2), R is R2 * B.


reverse2([],[]).
reverse2([X|Xrest],R) :- reverse2(Xrest,[R|X]).


member1(E,[E|_Xs]).
member1(E, [E|Xs]) :- member1(E,Xs).


inter([],_Ys,[]).
inter([X|Xs],Ys,R) :- member1(X,Ys), inter(Xs,Ys,R2),append(R2,[X],R).
inter([_X|Xs],Ys,R) :- inter(Xs,Ys,R).

