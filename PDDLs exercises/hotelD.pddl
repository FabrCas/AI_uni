(define (domain hotel)
(:requirements :adl)

(:predicates (room ?pos) (dirty ?pos) (guests ?pos) (at ?pos) (adj ?pos1 ?pos2) (clean ?pos)

)

(:action move
:parameters (?pos1 ?pos2)
:precondition (and (at ?pos1) (not(room ?pos2)) (adj ?pos1 ?pos2))
:effect (and (not(at?pos1)) (at ?pos2)) 
)

(:action enter
:parameters (?posMart ?posRoom )
:precondition (and (at ?posMart) (room ?posRoom) (adj ?posMart ?posRoom) (not(guests?posRoom)))
:effect  (and (not(at?posMart)) (at ?posRoom)) 
)

(:action clean
:parameters (?posRoom)
:precondition (and (at ?posRoom) (room ?posRoom) (dirty ?posRoom))
:effect (and (not(dirty ?posRoom)) (clean ?posRoom))
)

)