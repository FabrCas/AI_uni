plus1(0,X,X).
plus1(s(X),Y,s(Z)):-plus1(X,Y,Z).

times1(0,_X,0).
times1(s(X),Y,Z) :- times1(X,Y,XY), plus1(XY,Y,Z).

exp1(s(_N),0,0).
exp1(0,s(_X),s(0)).
exp1(s(N),X,Y) :- exp1(N,X,Z), times1(Z,X,Y).

fact(0,s(0)).
fact(s(N),F) :- fact(N,F1), times1(s(N),F1,F).

minimo(N1,N2,N1) :- lesseq1(N1,N2).
massimo(N1,N2,N2) :- lesseq1(N2,N1).

prefix([],_Ys).
prefix([X|Xs],[X|Ys]) :- prefix(Xs,Ys).

suffix(Xs,Xs).
suffix(Xs,[_Y|Ys]) :- suffix(Xs,Ys).

subset1([],_Xs).
subset1([Y|Ys],Xs) :-
      member1(Y,Xs),subset1(Ys,Xs).

reverse1([],[]).
reverse1([X|Xs],Zs) :- reverse1(Xs,Ys), append1(Ys,[X],Zs).

list1([a,b,c,d]).
list2([e,f,g,h]).
    
member1(X,[X|_Xs]).
member1(X,[_Y|Ys]) :- member1(X,Ys).

append1([],Ys,Ys).
append1([X|Xs],Ys,[X|Zs]) :- append1(Xs,Ys,Zs).

