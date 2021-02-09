(define (domain athletics)
(:requirements :adl)

(:predicates (athlets ?person) (trainer ?trainer) (loc ?loc) (adjT ?pos ?pos) (adjA ?pos ?pos)
(visited ?person ?loc) (at ?person ?position)
)

(:action moveAthlets
:parameters (?who ?from ?to)
:precondition (and (athlets ?who) (loc ?from) (loc ?to) (adjA ?from ?to) (at ?who ?from)
(visited t ?to)
)
:effect (and (not(at ?who ?from)) (at ?who ?to) 
)
)

(:action moveTrainer
:parameters (?from ?to ?fromAthlets)
:precondition (and (trainer t) (loc ?from) (loc ?to) (adjT ?from ?to) (at t ?from) (adjA ?fromAthlets ?to)
)
:effect(and (visited t ?to)  (visited t ?fromAthlets) (not(at t ?from)) (at t ?to)
)
)

)


