(define (problem hotel)
(:domain hotel)

(:objects pos11 pos12 pos13 pos21 pos22 pos23 pos31 pos32 pos33 pos41 pos42 pos43
)

(:init
(at pos21)

(room pos11) (room pos12) (room pos13)
(room pos41) (room pos42) (room pos43)

(clean pos11) (clean pos13)
(clean pos42)

(dirty pos12) 
(dirty  pos41) (dirty pos43)

(guests pos11) (guests pos13)
(guests pos41) (guests pos42) 

(adj pos11 pos21)
(adj pos12 pos22) 
(adj pos13 pos23) 

(adj pos21 pos11) (adj pos21 pos22) (adj pos21 pos31) (adj pos21 pos32) 
(adj pos22 pos21) (adj pos22 pos23) (adj pos22 pos12) (adj pos22 pos32) (adj pos22 pos31) (adj pos22 pos33)  
(adj pos23 pos22) (adj pos23 pos13) (adj pos23 pos33) (adj pos23 pos32)

(adj pos31 pos21) (adj pos31 pos32) (adj pos31 pos41) (adj pos31 pos22) 
(adj pos32 pos31) (adj pos32 pos33) (adj pos32 pos22) (adj pos32 pos42) (adj pos32 pos21) (adj pos32 pos23)  
(adj pos33 pos32) (adj pos33 pos23) (adj pos33 pos43) (adj pos33 pos22)

(adj pos41 pos31)  
(adj pos42 pos32) 
(adj pos43 pos33) 
)

(:goal (and (or (clean pos11) (guests pos11))
(or (clean pos12) (guests pos12))
(or (clean pos13) (guests pos13))
(or (clean pos41) (guests pos41))
(or (clean pos42) (guests pos42))
(or (clean pos43) (guests pos43))
))

)