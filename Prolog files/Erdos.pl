pub(erdos,brachman).
pub(erdos,einstein).
pub(erdos,konolige).
pub(brachman,nardi).
pub(nardi,settembre).
%pub(erdos,settembre).
%pub(brachman,erdos).
%pub(einstein,erdos).
%pub(konolige,erdos).
%pub(nardi,brachman).
%pub(settembre,nardi).
%pub(settembre,erdos).
%pub(X,Y):-pub(Y,X).

erd(X,N):- tryErd(X,0,10,N).
tryErd(X,C,Max,M):-M is C+1, M<Max, connected1(X,M).
tryErd(X,C,Max,M):-C1 is C+1, C1<Max,tryErd(X,C1,Max,M).

connected1(X,1):- pub(erdos,X).
connected1(X,1):- pub(X,erdos).
    
connected1(X,N):- pub(X,Y), N1 is N-1, N1>0, connected1(Y,N1).
connected1(X,N):- pub(Y,X), N1 is N-1, N1>0, connected1(Y,N1).



    
    
    
