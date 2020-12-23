% team members

pm(a).
pm(b).
gu(c).
gu(d).
sf(e).
sf(f).
pf(g).
pf(h).
pf(i).
ct(l).
ct(m).
ct(n).

basicQuintet(P1,P2,P3,P4,P5):-
    pm(P1),
    gu(P2),
    sf(P3),
    pf(P4),
    ct(P5).

twoPlayQuintet(P1,P2,P3,P4,P5):-
    pm(P1),
    pm(P2),
    sf(P3),
    pf(P4),
    ct(P5).

twoPlayQuintet1(P1,P2,P3,P4,P5):-
    pm(P1),
    pm(P2), P1 \== P2,
    sf(P3),
    pf(P4),
    ct(P5).
