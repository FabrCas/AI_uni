(define (problem robot-arm)
(:domain robot-arm)

(:objects p0 p1 p2 p3 yellow red blue 

)

(:init (pos p0) (pos p1) (pos p3) (pos p2)
(glass red) (glass blue) (glass yellow)
(isEmpty p1)

(at red p2) (at yellow p0) (at blue p3)
)

(:goal (and (at red p0) (at yellow p1) (at blue p2)

))
)