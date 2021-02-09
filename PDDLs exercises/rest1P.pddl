(define (problem rest)
(:domain rest)

(:objects robot lover0 lover1 Rest3 Rest9 ShoppingMall
)


(:init (at robot ShoppingMall) (at lover1 Rest9) (at lover0 Rest3)

(robot robot) (robot lover1) (robot lover0)

(loc Rest3)(loc Rest9) (loc ShoppingMall)
(date lover1 Rest3) (date lover0 Rest9) 

(adj Rest3 Rest9) (adj Rest3 ShoppingMall)
(adj Rest9 ShoppingMall) (adj Rest9 Rest3)
(adj ShoppingMall Rest3) (adj ShoppingMall Rest9)

(free ShoppingMall)
)


(:goal (and (date_complete lover0 Rest9) (date_complete lover1 Rest3)
))

)