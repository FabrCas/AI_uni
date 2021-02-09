(define (domain wumpus)

(:requirements :adl)

(:predicates (at ?object ?pos) (adj ?pos1 ?pos2) (wumpus ?wumpusPos) (havegold ?stick)
(dead ?stick) (arrow ?stick) (stink ?to ?from) (pit ?pos) (gold ?pos)
)

(:action move  ;action to move 
:parameters (?nextpos ?oldpos ?object)
:precondition (and (at ?object ?oldpos) (adj ?nextpos ?oldpos) (not(wumpus ?nextpos)) (not(pit ?nextpos)))
:effect (and (not(at ?object ?oldpos)) (at ?object ?nextpos) )
)
(:action shoot
:parameters (?object ?pos ?from)
:precondition (and (arrow ?object) (at ?object ?pos) (stink ?pos ?from) (wumpus ?from) )
:effect (and (not(wumpus ?from)) (not(arrow ?object)) ) 
)
(:action gatherGold
:parameters (?object ?pos)
:precondition (and (at ?object ?pos) (gold ?pos) )
:effect (and (havegold ?object))
)
)