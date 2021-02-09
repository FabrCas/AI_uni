(define (problem deviceplacement)
(:domain deviceplacement)

(:objects A B EMPTY
)

(:init (typea A) (typeb B) (pos11 EMPTY) (pos12 EMPTY) (pos21 EMPTY) (pos22 EMPTY)
(isEmpty EMPTY)
)

(:goal (or (and (pos11 A) (pos12 B) (pos21 B) (pos22 A) )
(and (pos11 B) (pos12 A) (pos21 A) (pos22 B) )
))

)