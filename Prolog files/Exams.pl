
%Midterm 18TH 2019
%My solutions
matrix([[1,2,3],[4,5,6],[7,8,9]]).
matrix2([[1,0,0],[0,1,0],[0,0,9]]).


getd([Restm|_Restn],V,1,X):- getElem(Restm,V,X).
getd([[E|Restm]|Restn],V,I,Result):-
    I>=1,
    I1 is I-1,
    getd(Restn,V,I1,Result).

getElem([X|_Rest],1,X).
getElem([_X|Rest],I,Elem):- I>=1,I2 is I-1, getElem(Rest,I2,Elem).

getdiag(M,Res):- length(M,N),aux(M,1,N,Res).

aux(_M,I,N,[]):- N2 is N+1, N2==I.
aux([Restm|Restn],I,N,[Val|Res]):- I=<N,I2 is I+1, getElem(Restm,I,Val), aux(Restn,I2,N,Res).

list_check_diag([],_I).
list_check_diag([X|Xs],I) :- I==1,X\==0,I2 is I-1, list_check_diag(Xs,I2).
list_check_diag([X|Xs],I) :- X==0,I2 is I-1, list_check_diag(Xs,I2).

is_diagonal(M):- active(M,1).

active([],N) :- N>=1.
active([Row|Rest],I):- length([Row|Rest],N), N>=1, I2 is I+1, list_check_diag(Row,I), active(Rest,I2).




%Solution prof/ length is used to check that is sqaured

getd2([X|Xs],I,V) :- length(X,N),length([X|Xs],N),I<N+1,getElem([X|Xs],I,R),getE(R,I,V).












%Exercise various

alberobin(tree(a,tree(b,tree(d,void,void),tree(e,void,void)),
                 tree(c,tree(f,void,void),tree(g,void,void)))).

has_element(tree(X,Left,Right),X).
has_element(tree(Node,Left,Right),X):- has_element(Right,X).
has_element(tree(Node,Left,Right),X):- has_element(Left,X).




% scalar product

scalar_brodo([],[],0).
scalar_brodo([X|Xs],[Y|Ys],Res) :-  Prod is X*Y, scalar_brodo(Xs,Ys,Res1), Res is Res1 + Prod.


% path bin, tree, list of forbidden nodes, path from the root to leaves,
% with only one forbidden value.
%
%
have_elem(X,[X|Rest]).
have_elem(X,[Val|Rest]):- have_elem(X,Rest).

%-----------------------------------------
path(void,_List, Occ):- Occ==1.
path(tree(A,Left,Right), List, Occ):-
    have_elem(A,List),
    Occ1 is Occ + 1,
    path(Left,List,Occ1),
    path(Right,List,Occ1).
path(tree(_A,Left,Right), List, Occ):-
    path(Left,List,Occ),
    path(Right,List,Occ).


forbidden(Tree, List):- path(Tree,List,0). %0 is the number of occourencies
%-----------------------------------------


auxlistToNum([],0,_Dec).
auxlistToNum([X|Rest],Result,Dec):- pow(10,Dec,Molt), Val is X * Molt, Dec2 is Dec - 1 , auxlistToNum(Rest,Result1,Dec2), Result is Result1 + Val.


listToNum(List,Val) :- length(List,Len), Len2 is Len -1, auxlistToNum(List,Val,Len2).

%-----------------------------------------

tonum([], 0).
tonum([X|Xs], N) :- tonum(Xs, Nn), len(Xs, L), L>0, N is Nn+(X*10^L).
tonum([X|Xs], N) :- tonum(Xs, Nn), N is Nn+X.
%-----------------------------------------


associativeList([[a,f(node0)],[b,f(1)],[c,f(2)]]).

is_al([]).
is_al([[A,NA]|Rest]) :- atom(A),not(atom(NA)),is_al(Rest).

% findT([],Val,f(Val)).
%
findT([[A,f(X)]|_Rest],A,f(X)).
findT([[_A,_NA]|Rest],Val,Res):- findT(Rest,Val,Res).

subs(X,[],[]). % all element added
subs([[A,NA]|Resta],[A|Restb],[NA|Result]) :- subs(Resta,Restb,Result).
subs([[A,NA]|Resta],List,Result) :-subs(Resta,List,Result).

%-----------------------------------------

%CHECK IF a list is a palindromo

palindromo([]).
palindromo([X|Xs]):- getLastElem([X|Xs],X2,[_First|Nlist]),X==X2,palindromo(Nlist).
palindromo([_X]).


getLastElem([X],X,[]).
getLastElem([X|Rest],Last,[X|NList]):- getLastElem(Rest,Last,NList).
%----------------------------------------- 2017 mid

length2([],0).
length2([X|Rest],V) :-  length2(Rest,V2), V is V2+1.   %%it's important not to write V is V+1, because we want to use the value which comes from the backtracking.

cutfewer([],_Cut,[]).
cutfewer([X|Rest], Cut, Result) :- length2(X,Len), Len<Cut, cutfewer(Rest,Cut,Result1),append(X,Result1,Result).
cutfewer([_X|Rest], Cut, Result) :- cutfewer(Rest,Cut,Result).


% not perfect, todo

appendM(List,List2,[List|List2])







%-----------------------------------------
