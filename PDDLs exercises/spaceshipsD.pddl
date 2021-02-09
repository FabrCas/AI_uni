(define (domain spaceships)
(:requirements :adl)

(:predicates (spaceship ?x) (pos ?pos) (adjR ?from ?to) (adjB ?from ?to) 
(relict ?relic) (taken ?what ?fromWho) (enemyIn ?pos) (relictIn ?relict ?pos)
 (at ?spaceship ?pos)
)

(:action moveRed
:parameters (?from ?to ?bluePos)
:precondition (and (at r ?from) (pos ?from) (pos ?to) (pos ?bluePos) (adjR ?from ?to) (at b ?bluePos) (not(enemyIn ?from)) (not(enemyIn ?bluePos)) 
)
:effect (and (not(at r ?from)) (at r ?to)
)
)

(:action moveBlue
:parameters (?from ?to ?redPos)
:precondition (and (at b ?from) (pos ?from) (pos ?to) (pos ?redPos) (adjB ?from ?to) (at r ?redPos) (not(enemyIn ?from)) (not(enemyIn ?redPos)) 
)
:effect (and (not(at b ?from)) (at b ?to)
)
)

(:action shootBlue
:parameters (?pos)
:precondition (and (at b ?pos) (pos ?pos)(enemyIn ?pos)
)
:effect (and (not(enemyIn ?pos)) 
)
)

(:action shootRed
:parameters (?pos)
:precondition (and (at r ?pos) (pos ?pos) (enemyIn ?pos)
)
:effect (and (not(enemyIn ?pos)) 
)
)

(:action takeRelict
:parameters (?relR ?relB ?posR ?posB)
:precondition (and (at r ?posR) (at b ?posB) (relict ?relR) (relict ?relB) (relictIn ?relR ?posR) (relictIn ?relB ?posB)
)
:effect (and (taken ?relR r) (taken ?relB b)
)
)




)