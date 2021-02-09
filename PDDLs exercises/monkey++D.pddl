(define (domain monkey)
(:requirements :adl)

(:predicates (monkey ?who) (box ?what) (banana ?what) (scissors ?what) (upPos ?what)
(pos ?pos) (at ?who ?pos) (adj ?from ?to) (collected ?what ?fromWho)

)

(:action move 
:parameters (?who ?from ?to)
:precondition (and (monkey ?who) (pos ?from) (pos ?to) (at ?who ?from) (adj ?from ?to)  (not(upPos ?who))
)
:effect (and (not (at ?who ?from)) (at ?who ?to))
)

(:action collectScissors
:parameters (?pos ?who ?what)
:precondition (and (monkey ?who) (pos ?pos) (at ?who ?pos) (upPos ?what) (scissors ?what) (upPos ?who) (at ?what ?pos) 
)
:effect (collected ?what ?who)
)

(:action collectBanana
:parameters (?pos ?who ?what)
:precondition (and (monkey ?who) (pos ?pos) (at ?who ?pos) (at ?what ?pos)  (upPos ?what) (banana ?what) (upPos ?who) (collected scissors ?who)
)
:effect (collected ?what ?who)
)

(:action climbBox 
:parameters (?pos ?who ?what)
:precondition (and  (monkey ?who) (pos ?pos) (box ?what) (at ?what ?pos) (at ?who ?pos) (not(upPos ?who)))
:effect (and (upPos ?who))
)

(:action getoffBox 
:parameters (?pos ?who ?what)
:precondition (and (monkey ?who) (pos ?pos) (box ?what) (at ?what ?pos) (at ?who ?pos) (upPos ?who))
:effect (and (not(upPos ?who)))
)

(:action pushBox 
:parameters (?from ?to ?who ?what)
:precondition (and (monkey ?who) (pos ?from) (pos ?to) (box ?what) (at ?what ?from) (at ?who ?from) (not(upPos ?who)) (adj ?from ?to))
:effect (and (not (at ?who ?from)) (at ?who ?to) (not(at ?what ?from)) (at ?what ?to))
)

)
