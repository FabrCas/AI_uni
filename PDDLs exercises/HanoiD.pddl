(define (domain hanoi)
(:requirements :adl :conditional-effects)

(:predicates (disk ?disk1)  (graterdisk ?disk1 ?disk2) (on ?rod ?disk) 
(upperpos ?pos1 ?pos2) (downpos ?pos1 ?pos2) (upperdisk ?rod ?disk)
)

(:action move
:parameters (?rod1 ?rod2 ?rodFrom ?rodTo ?diskFrom ?diskTo ?nextrodFrom ?nextrodTo ?prevdiskfrom) 
:precondition (and (disk ?diskFrom) (disk ?diskTo)  ;are disks
(graterdisk ?diskTo ?diskFrom)   ;disk from bigger than disk on to
(upperpos ?rodFrom ?nextrodFrom)   ;nextrodfrom
(downpos ?rodTo ?nextrodTo)    ;nextrodto
(upperdisk ?rod1 ?diskFrom)
(upperdisk ?rod2 ?diskTo)
(on ?nextrodfrom ?prevdiskfrom)
)
:effect (and (not(on ?rodFrom ?diskFrom)) 
 (on ?rodTo ?diskFrom)
 ; update upperdisk
 (upperdisk ?rod1 ?prevdiskfrom) (not(upperdisk ?rod1 ?diskFrom))
 (upperdisk ?rod2 ?diskFrom) (not(upperdisk ?rod2 ?diskTo))
)
)

)