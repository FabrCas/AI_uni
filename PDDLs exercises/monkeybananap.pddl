 (define (problem monkey-bananas)
(:domain mb)

(:objects
pos1 pos2 pos3
true false bananas 
)

(:init (at pos1) (BoxAt pos3) (onBox false) (bananasAt pos3))
(:goal (have bananas))
)

