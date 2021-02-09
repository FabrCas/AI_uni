(define (domain rest)
(:requirements :adl)

(:predicates (at ?robot ?loc) (loc ?loc) (robot ?robot) (date ?withWho ?where) 
(date_complete ?withWho ?where) (adj ?from ?to)(free ?loc)
)

(:action move 
:parameters (?from ?to )
:precondition (and (at robot ?from) (loc ?from) (loc ?to) (adj ?from ?to)
)
:effect (and (not(at robot ?from)) (at robot ?to)
)
)

(:action transfer 
:parameters (?from ?to ?lover ?x)
:precondition (and (loc ?from) (loc ?to) (robot ?lover) (adj ?from ?to) (at robot ?from) (at ?lover ?from) (date? ?lover ?x)
(free ?to)
)
:effect (and (not (at robot ?from)) (at robot ?to) (not(at ?lover ?from)) (at ?lover ?to) (not(free ?to)) (free ?from)
)
)

(:action date 
:parameters (?loc ?lover)
:precondition (and (loc ?loc) (robot ?lover)  (at robot ?loc) (at ?lover ?loc) (date ?lover ?loc)
)
:effect (and (date_complete ?lover ?loc) (not(date ?lover ?loc))
)
)

)
