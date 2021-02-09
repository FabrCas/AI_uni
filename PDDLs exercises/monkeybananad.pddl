(define (domain mb)

(:requirements :adl)

(:predicates (at ?x) (BoxAt ?x) (onBox ?level) (bananasAt ?b) (have ?b))

(:action GoBox
:parameters (?boxposition  ?monkeypos)
:precondition (and (BoxAt ?boxposition) (at ?monkeypos) (onBox false))
:effect (and (at ?boxposition))
)

(:action climbBox
:parameters (?boxpos)
:precondition (and (at ?boxpos) (BoxAt ?boxpos) (onBox false))
:effect (and (onBox true))
)

(:action pushBoxBananas
:parameters (?bananaspos ?monkeypos)
:precondition (and (at ?monkeypos) (BoxAt ?monkeypos)(bananasAt ?bananaspos) (onBox false) )
:effect (and (at?bananaspos))
)

(:action grabBananas
:parameters (?monkeypos ?bananaspos)
:precondition (and (at ?monkeypos) (bananasAt ?bananaspos) (onBox true))
:effect (and (have bananas))
)

)
