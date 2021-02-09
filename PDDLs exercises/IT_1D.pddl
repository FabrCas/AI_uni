(define (problem it)
(:domain it)

(:objects ballon boat clown georgie p1 p0 p2 p3 p4 p5 p6
)

(:init (with georgie boat) (with clown ballon) (at georgie p0) (at clown p6)
(georgie georgie) (clown clown) (ballon ballon) (boat boat)

(deniedGeorgie p4)  (deniedGeorgie p2)  (deniedGeorgie p6)  (deniedGeorgie p5)
(deniedClown p0) (deniedClown p3)
(adj p1 p3) (adj p1 p0) (adj p1 p4) (adj p1 p2) (adj p1 p6) (adj p1 p5)
(adj p0 p1) (adj p0 p3)
(adj p3 p1) (adj p3 p0)
(adj p4 p1) (adj p4 p2) (adj p4 p6) (adj p4 p5)
(adj p2 p1) (adj p2 p4) (adj p2 p6) (adj p2 p5)
(adj p6 p1) (adj p6 p4) (adj p6 p2) (adj p6 p5)
(adj p5 p1) (adj p5 p4)  (adj p5 p2) (adj p5 p6)
)

(:goal (and (with georgie ballon) (with clown boat) (at georgie p3) (at clown p5)
))
)