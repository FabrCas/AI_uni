(define (domain museum)
(:requirements :adl)

(:predicates (at ?pos) (adj ?pos1 ?pos2) (visitors ?pos) (switcher ?pos) (wet_floor ?pos) 
(audiolog ?positionVisitors) (lightoff ?posSwitcher)
)

(:action move
:parameters (?posFrom ?posTo)
:precondition (and (at ?posFrom) (adj ?posFrom ?posTo) (not(wet_floor ?posTo))
)
:effect (and (not(at ?posFrom)) (at ?posTo) 
)
)

(:action switchLight 
:parameters (?posMart)
:precondition (and (at ?posMart) (switcher ?posMart) (lightoff switcher1) 
)
:effect (and (not  (lightoff switcher1))
)
)

(:action audiolog 
:parameters (?posMart)
:precondition (and (not(lightoff switcher1)) (at ?posMart) (visitors ?posMart)
)
:effect (audiolog ?posMart)
)

)