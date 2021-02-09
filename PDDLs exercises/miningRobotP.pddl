(define (problem mining)
(:domain mining)

(:objects A22 A21 A20 A12 A11 A10 A01 A02 A00 robot pickaxe mineral on off
)

(:init

(cell A00)(cell A01)(cell A02)(cell A10)(cell A11)(cell A12)(cell A20)(cell A21)(cell A22)
(robot robot) (mineral mineral) (pickaxe pickaxe)
(exit A02) 
(hold off)
(at robot A00) (at mineral A20) (at pickaxe A11)

(adj A00 A10) (adj A00 A01)
(adj A10 A00) (adj A10 A11) (adj A00 A10) (adj A10 A20)
(adj A20 A10) (adjBlocked A20 A21)
(adj A01 A00) (adj A01 A11) (adjBlocked A01 A02)
(adj A11 A10) (adj A11 A01) (adjBlocked A11 A12) (adjBlocked A11 A21)
(adj A21 A22) (adjBlocked A21 A20) (adjBlocked A21 A11)
(adj A02 A12) (adjBlocked A02 A01)
(adj A12 A02) (adjBlocked A12 A11) (adj A12 A22)
(adj A22 A12) (adj A22 A21)

)

(:goal (and (at robot A02) (isHolding mineral) 
))

)