(define (problem museum)
(:domain museum)

(:objects pos01 pos02 pos03 pos04 pos11 pos12 pos13 pos14 
switcher1
)

(:init
(at pos11) (visitors pos01) (visitors pos03) (visitors pos13)
(switcher pos12) (wet_floor pos02) (lightoff switcher1)

;the grid adjacents
(adj pos01 pos02) (adj pos01 pos11)
(adj pos02 pos01) (adj pos02 pos03)
(adj pos03 pos02) (adj pos03 pos04)
(adj pos04 pos03) (adj pos04 pos14)
(adj pos11 pos01) (adj pos11 pos12)
(adj pos12 pos11) (adj pos12 pos13)
(adj pos13 pos12) (adj pos13 pos14)
(adj pos14 pos13) (adj pos14 pos04)

)

(:goal (and (audiolog pos01) (audiolog pos03) (audiolog pos13)
))

)