% 1
pow2(0,E,0).
pow2(B,0,1).
pow2(B,E,Z) :-  E2 is E-1, pow2(B,E2,Z * B).

% 2 ,X,Y the two values, Z the value to check whether is fewer

minimum2(X,Y,X) :- X =< Y.
minimum2(X,Y,Y) :- Y =< Z.

% sum 3

sum3(0,0).
sum3(N,Z) :- N2 is N-1, sum3(N2,Y), Z is Y+N.

notmember1(_E,[]).
notmember1(E, [X|Xs]) :- X\==E, notmember1(E,Xs).

member1(E,[E|_Xs]).
member1(E, [E|Xs]) :- member1(E,Xs).

% erdosnum
% defined KB
pub(erdos, branchman).
pub(erdos, einstein).
pub(erdos, konoluge).
pub(branchman, nardi).
pub(nardi,settembre).
pub(settembre, erdos).
%pub(X,Y) :- pub(Y,X).

%actual program

callerdosnum(X,N):- erdosnum(X,N,[]).

erdosnum(erdos,1, _L).
erdosnum(X,N,L):- pub(X,Y), notmember1(Y,L), erdosnum(Y, V, [Y|L]), N is  V +1 .

% erdosnum connected.

callerdosnum2(X,Y,N):- erdosnum2(X,Y,N,[]).

erdosnum2(X,X,1).
erdosnum2(X,Y,N,L):- pub(X,V), notmember1(Y,L), erdosnum2(Y,V,VALUE,[Y|L]), N is VALUE +1.
