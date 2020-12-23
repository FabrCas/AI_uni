% player a,b,c,d,e,f,g
% creating the knowledge base
pm(a).
pm(b).
gr(c).
gr(d).
gr(e).
fw(f).
fw(g).
ct(h).
fwp(f).
fws(g).

basic_quintet(A1,A2,A3,A4,A5) :- pm(A1), gr(A2), fwp(A3), fws(A4), ct(A5).

basic_quintet_no_spec(A1,A2,A3,A4,A5) :- pm(A1), gr(A2), fw(A3), fw(A4), ct(A5).

basic_quintet_no_spec_no_rep(A1,A2,A3,A4,A5) :- pm(A1), gr(A2), fw(A3), fw(A4), ct(A5), A3\==A4.

