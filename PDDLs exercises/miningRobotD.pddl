(define (domain mining)
(:requirements :adl)

(:predicates (adj ?cell1 ?cell2) (cell ?cell) (at ?who ?pos) (robot ?robot) (mineral ?mineral)
(exit ?pos) (pickaxe ?pickaxe) (adjBlocked ?cell1 ?cell2) (isHolding ?holdable) (hold ?on-off)
)

(:action move
:parameters (?who ?from ?to)
:precondition (and (robot ?who) (at ?who ?from) (cell ?from) (cell ?to)  (adj ?from ?to)
(not(adjBlocked ?from ?to))
)
:effect(and (not (at ?who ?from)) (at ?who ?to)
)
)

(:action collect
:parameters (?object ?posObject ?who ?something)
:precondition (and (robot ?who) (cell ?posObject) (at ?object ?posObject) (at ?who ?posObject) (hold off)
)
:effect(and (hold on) (not(hold off)) (isHolding ?object) (not(at ?object ?posObject))
)
)

(:action destroy
:parameters (?who ?pos ?otherpos)
:precondition (and (robot ?who) (cell ?pos) (cell ?otherpos) (at ?who ?pos) (adjBlocked ?pos ?otherpos)
(isHolding pickaxe) (hold on)
)
:effect (and (not(adjBlocked ?pos ?otherpos)) (adj ?pos ?otherpos) (not(isHolding pickaxe)) (not(hold on)) (hold off)
)
)

)