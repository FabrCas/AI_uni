pow1(0,N,0):-N\==0.
pow1(N,0,1).
pow1(B,E,Z) :- E1 is E-1, pow1(B,E1,W), Z is B*W.

minimum(N1,N2,N1) :- lesseq1(N1,N2).
minimum(N1,N2,N2) :- lesseq1(N2,N1).
