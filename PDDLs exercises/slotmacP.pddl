(define (problem slot)
(:domain slot)
(:objects 0 1 2 3 4
)

(:init (digit0 1) (digit1 3) (digit2 1) (digit3 2)
)

(:goal (or (and (digit0 1) (digit1 1) (digit2 1) (digit3 1))
(and (digit0 2) (digit1 2) (digit2 2) (digit3 2))
(and (digit0 0) (digit1 0) (digit2 0) (digit3 0))
(and (digit0 3) (digit1 3) (digit2 3) (digit3 3))
(and (digit0 4) (digit1 4) (digit2 4) (digit3 4))
))

)