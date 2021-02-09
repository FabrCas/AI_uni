(define (problem  spaceships)
(:domain spaceships)

(:objects r b  p1 p2 p3 pz px py r0 r1 
)

(:init
(spaceship r) (spaceship b) (pos p1) (pos p2) (pos p3)
(pos px) (pos py) (pos pz) (relict r0) (relict r1)

(at r pz) (at b p1)
(enemyIn py) (enemyIn p1) (enemyIn p2)
(relictIn r0 px) (relictIn r1 p3)

(adjR pz py) (adjR py px)
(adjB p1 p2) (adjB p2 p3)
)

(:goal (and (taken r0 r) (taken r1 b)
))
)