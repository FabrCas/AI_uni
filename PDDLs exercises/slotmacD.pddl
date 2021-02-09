(define (domain slot)
(:requirements :adl)
(:predicates (digit1 ?val) (digit2 ?val) (digit3 ?val) (digit0 ?val)
)
(:action pull_lever0
:parameters (?d0 ?d1 ?d2 ?d3)
:precondition: (and (digit0 ?d0) (digit1 ?d1) (digit2 ?d2) (digit3 ?d3)
((?d0 +3)%5 + ?d1 +?d2 +?d3 < 10) ((?d0 +3)%5 + ?d1 +?d2 +?d3 > 4) )
:effect (and (not(digit0 ?d0)) (digit0 (?d0 +3)%5)) 
)

(:action pull_lever1
:parameters (?d0 ?d1 ?d2 ?d3)
:precondition:(and (digit0 ?d0) (digit1 ?d1) (digit2 ?d2) (digit3 ?d3)
((?d1 +3)%5 + ?d1 +?d2 +?d3 < 10) ((?d1 +3)%5 + ?d1 +?d2 +?d3 > 4))
:effect (and (not(digit0 ?d1)) (digit0 (?d1 +3)%5))
)

(:action pull_lever2
:parameters (?d0 ?d1 ?d2 ?d3)
:precondition:(and (digit0 ?d0) (digit1 ?d1) (digit2 ?d2) (digit3 ?d3)
((?d2 +3)%5 + ?d1 +?d2 +?d3 < 10) ((?d2 +3)%5 + ?d1 +?d2 +?d3 > 4))
:effect (and (not(digit0 ?d2)) (digit0 (?d2 +3)%5))
)

(:action pull_lever3
:parameters (?d0 ?d1 ?d2 ?d3)
:precondition: (and (digit0 ?d0) (digit1 ?d1) (digit2 ?d2) (digit3 ?d3)
((?d3 +3)%5 + ?d1 +?d2 +?d3 < 10) ((?d3 +3)%5 + ?d1 +?d2 +?d3 > 4))
:effect (and (not(digit0 ?d3)) (digit0 (?d3 +3)%5) )
)

)