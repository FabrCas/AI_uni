(define (domain deviceplacement)
(:requirements :adl)

(:predicates (typea ?obj) (typeb ?obj) (isEmpty ?obj) (pos11 ?obj) (pos12 ?obj) (pos21 ?obj) (pos22 ?obj)

)

;*********************************************        A          *******************************************************************
(:action insert11A
:parameters (?newobj ?oldobj)
:precondition (and (pos11 ?oldobj) (typea ?newobj) (not(typea ?oldobj)) (not(pos21 ?newobj)) (not(pos12 ?newobj))
)
:effect (and (not(pos11 ?oldobj)) (pos11 ?newobj))
)

(:action insert12A
:parameters (?newobj ?oldobj)
:precondition (and (pos12 ?oldobj) (typea ?newobj) (not(typea ?oldobj)) (not(pos11 ?newobj)) (not(pos22 ?newobj))
)
:effect (and (not(pos12 ?oldobj)) (pos12 ?newobj))
)

(:action insert21A
:parameters (?newobj ?oldobj)
:precondition (and (pos21 ?oldobj) (typea ?newobj) (not(typea ?oldobj)) (not(pos11 ?newobj)) (not(pos22 ?newobj))
)
:effect (and (not(pos21 ?oldobj)) (pos21 ?newobj))
)

(:action insert22A
:parameters (?newobj ?oldobj)
:precondition (and (pos22 ?oldobj) (typea ?newobj) (not(typea ?oldobj)) (not(pos21 ?newobj)) (not(pos12 ?newobj))
)
:effect (and (not(pos22 ?oldobj)) (pos22 ?newobj))
)
;*********************************************        B          *******************************************************************
(:action insert11B
:parameters (?newobj ?oldobj)
:precondition (and (pos11 ?oldobj) (typeb ?newobj) (isEmpty ?oldobj) (not(pos21 ?newobj)) (not(pos12 ?newobj))
)
:effect (and (not(pos11 ?oldobj)) (pos11 ?newobj))
)

(:action insert12B
:parameters (?newobj ?oldobj)
:precondition (and (pos12 ?oldobj) (typeb ?newobj) (isEmpty ?oldobj) (not(pos11 ?newobj)) (not(pos22 ?newobj))
)
:effect (and (not(pos12 ?oldobj)) (pos12 ?newobj))
)

(:action insert21B
:parameters (?newobj ?oldobj)
:precondition (and (pos21 ?oldobj) (typeb ?newobj) (isEmpty ?oldobj) (not(pos22 ?newobj)) (not(pos11 ?newobj))
)
:effect (and (not(pos21 ?oldobj)) (pos21 ?newobj))
)

(:action insert22B
:parameters (?newobj ?oldobj)
:precondition (and (pos22 ?oldobj) (typeb ?newobj) (isEmpty ?oldobj) (not(pos21 ?newobj)) (not(pos12 ?newobj))
)
:effect (and (not(pos22 ?oldobj)) (pos22 ?newobj))
)

)