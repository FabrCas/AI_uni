/*  Programmi lezione 3 */

memberlist(X,[X|_Xs]).
memberlist(X,[Y|_Ys]) :- memberlist(X,Y).
memberlist(X,[_Y|Ys]) :- memberlist(X,Ys).

countListElems([], 0).
countListElems([X|Xs], N):-
	countListElems(X, N1),
	countListElems(Xs, N2),
	N is N1+N2.

countListElems(_X, 1).

evalExpression(plus(A,B), N):-
	evalExpression(A, N1),
	evalExpression(B, N2),
	N is N1+N2.

evalExpression(minus(A,B), N):-
	evalExpression(A, N1),
	evalExpression(B, N2),
	N is N1-N2.

evalExpression(mult(A,B), N):-
	evalExpression(A, N1),
	evalExpression(B, N2),
	N is N1*N2.

evalExpression(frac(A,B), N):-
	evalExpression(A, N1),
	evalExpression(B, N2),
	N is N1 // N2.

evalExpression(X, X).

/* Alberi binari */

alberobin(tree(a,tree(b,tree(d,void,void),tree(e,void,void)),
                 tree(c,tree(f,void,void),tree(g,void,void)))).

binary_tree(void).
binary_tree(tree(_Element,Left,Right)) :-
	binary_tree(Left), binary_tree(Right).

hasElement(X, tree(X, _Left, _Right)).

hasElement(X, tree(_Element,Left,_Right)):-
	hasElement(X, Left).
hasElement(X, tree(_Element, _Left, Right)) :-
	hasElement(X, Right).

countLastElem(void, 0).
countLastElem(tree(_Element, _Left, _Right), 1).

countDeepElems(void, _Level, _CLevel, 0).
countDeepElems(tree(_Element, Left, Right), Level, CLevel, N) :-
	Level>CLevel, !,
	NLevel is CLevel+1,
	countDeepElems(Left, Level, NLevel, NLeft),
	countDeepElems(Right, Level, NLevel, NRight),
	N is NLeft+NRight.

countDeepElems(X, Level, Level, N):-
	countLastElem(X,N).

countDeepElems(X, L, N):-
	countDeepElems(X, L, 0, N).

/* versione ristretta di bredth first */

bf([], []).
bf([void | Rest], Ls):- bf(Rest, Ls).
bf([tree(I, Dx, Sx)| Rest], [I|Ls]):-
    append(Rest, [Dx, Sx], Nodes), bf(Nodes, Ls).

preorder(void, []).
preorder(tree(X, Left, Right), CompleteList):-
	        preorder(Left, LeftList),
	        preorder(Right, RightList),
	        append([X|LeftList], RightList, CompleteList).

inorder(void, []).
inorder(tree(X, Left, Right), CompleteList):-
			        inorder(Left, LeftList),
			        inorder(Right, RightList),
			        append(LeftList, [X|RightList], CompleteList).
			
postorder(void, []).
postorder(tree(X, Left, Right), CompleteList):-
				postorder(Left, LeftList),
				postorder(Right, RightList),
				append(LeftList, RightList, Z),
				append(Z, [X], CompleteList).

