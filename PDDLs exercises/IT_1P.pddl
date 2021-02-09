(define (domain it)
(:requirements :adl)

(:predicates (adj ?pos1 ?pos2) (at ?who ?where) (free ?who) (onGround ?where ?what) (with ?who ?what)
(deniedClown ?pos) (deniedGeorgie ?pos) (georgie ?who) (clown ?who) (ballon ?what) (boat ?what)
)
(:action moveGeorgie
    :parameters (?from ?to ?who ?other)
    :precondition (and (georgie ?who) (at ?who ?from) (not(deniedGeorgie ?to)) (clown ?other) (not(at ?other ?to))
    (adj ?from ?to))
    :effect (and (not(at ?who ?from)) (at ?who ?to)
    )
)

(:action moveClown
    :parameters (?from ?to ?who ?other)
    :precondition (and (clown ?who) (at ?who ?from) (not(deniedClown ?to)) (georgie ?other) (not(at ?other ?to))
    (adj ?from ?to))
    :effect (and (not(at ?who ?from)) (at ?who ?to)
    )
)

(:action pickup
:parameters (?who  ?what)
:precondition (and (at ?who p1) (onGround p1 ?what) (free ?who) 
)
:effect (and (not (onGround p1 ?what)) (not (free ?who)) (with ?who ?what)
)
)

(:action drop
:parameters (?who  ?what ?whatnot)
:precondition (and (at ?who p1) (not (onGround p1 ?what)) (not (free ?who)) (with ?who ?what) (or (ballon?whatnot)
)
:effect (and (onGround p1 ?what) (free ?who) (not (with ?who ?what))
)
)
)