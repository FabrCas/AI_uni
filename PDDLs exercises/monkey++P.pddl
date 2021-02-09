(define (problem monkey)
(:domain monkey)


(:objects monkey box scissors banana p1 p2 p3 p4 
)

(:init (monkey monkey) (banana banana) (scissors scissors) (box box) (upPos banana) (upPos scissors)
(pos p1) (pos p2) (pos p4) (pos p3) (at monkey p1) (at banana p2) (at box p3) (at scissors p4)

(adj p1 p2) (adj p2 p1) (adj p2 p3) (adj p3 p4) (adj p3 p2)
(adj p4 p3)
)

(:goal (and (collected banana monkey) ;
))

)