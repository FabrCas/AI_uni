(define (problem wumpus-world)
(:domain wumpus)

(:objects
pos11 pos12 pos13 pos21 pos22 pos23 stick wumpus gold pit 
)

(:init
 (adj pos11 pos12) (adj pos11 pos21)
 (adj pos12 pos11) (adj pos12 pos22) (adj pos12 pos13)
 (adj pos21 pos11) (adj pos21 pos22)
 (adj pos22 pos21) (adj pos22 pos12) (adj pos22 pos23)
 (adj pos13 pos12) (adj pos13 pos23)
 (adj pos23 pos22) (adj pos23 pos13)
(at stick pos11) (wumpus pos23) (arrow stick) (stink pos22 pos23) (stink pos13 pos23) 
(gold pos13) (pit pos12)
)

(:goal (and (havegold gold) (at stick pos11)
))

)