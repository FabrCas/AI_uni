(define (problem athletics)
(:domain athletics)

(:objects t a0 a1 p0 o0 p1 p2 o1 p3 
)

(:init (athlets a0) (athlets a1) (trainer t) (loc P0) (loc p0) (loc o0) (loc p1)
(loc p2) (loc o1) (loc p3)
(at t p0) (at a0 p0) (at a1 p0) (visited t p0) ; (visited a0 p0) (visited a1 p0)

(adjT p0 p1) (adjT p1 p2) (adjT p2 p3)

(adjA p0 o0) (adjA o0 p1) (adjA p1 p2) (adjA p2 o1) (adjA o1 p3)
)

(:goal (and (at t p3) (at a0 p3) (at a1 p3)
))

)