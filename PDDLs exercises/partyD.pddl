(define (domain party)
(:requirements :adl)

(:predicates (cell ?cell) (notsafecell ?cell) (adj ?cell1 ?cell2) (guardAt ?cell) 
(personAt ?cell ?person) (person ?person)
)

(:action move
:parameters:(?from ?to)
:precondition: (and (adj ?from ?to) (cell ?from) (cell ?to) (guardAt ?from)
)
:effect (and (not(guardAt ?from)) (guardAt ?to)
)
)

(:action separate
:parameters (?pos ?person ?moveTo ?otherperson)
:precondition (and (guardAt ?pos) (cell ?pos) (notsafecell ?pos) (person ?person) (personAt ?pos ?person)  ;check if not safe and take one person 
 (cell ?moveTo) (adj ?pos ?moveTo) (person ?otherperson) (not (personAt ?moveTo ?otherperson))  ;look for suitable cell for moving the person
)
:effect (and (personAt ?moveTo ?person ) (not(personAt ?pos ?person)) (not (notsafecell ?pos))
)
)

)
