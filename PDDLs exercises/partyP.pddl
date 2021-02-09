(define (problem party)
(:domain party)


(:objects girl1A girl2A child1A child2A child1B child2B girl2B girl1B try1 try2
A00 A01 A02 A10 A11 A12 A20 A21 A22 B00 B01 B02 B10 B11 B12 B20 B21 B22

)

(:init
(cell A00) (cell A01) (cell A02) (cell A10) (cell A11) (cell A12) (cell A20) (cell A21)
(cell A22) (cell B00) (cell B01) (cell B02) (cell B10) (cell B11) (cell B12) (cell B20)
(cell B21) (cell B22)
(guardAt A12) (notsafecell A11) (notsafecell B20)
(person girl1B) (person girl2B) (person girl2A) (person girl1A) (person child2B)
(person child1B) (person child2A) (person child1A)
(person try1) (person try2)
(personAt A11 girl1A) (personAt A11 girl2A) (personAt A10 child1A) (personAt A02 child2A)
(personAt B20 girl1B) (personAt B20 child1B) (personAt B01 child2B) (personAt B22 girl2B)
(personAt A12 try1) ;(personAt A11 try2) 



;first floor
(adj A22 A21) (adj A22 A12) 
(adj A21 A22) (adj A21 A20) (adj A21 A11)
(adj A20 A10) (adj A20 A21)
(adj A12 A22) (adj A12 A02) (adj A12 A11)
(adj A11 A12) (adj A11 A10)(adj A11 A01)(adj A11 A21) 
(adj A10 A00) (adj A10 A20) (adj A10 A11)
(adj A02 A12) (adj A02 A01)
(adj A01 A02) (adj A01 A00) (adj A01 A11) 
(adj A00 A10) (adj A00 A01)

(adj A00 B00) (adj B00 A00) ;ladder
;second floor
(adj B22 B21) (adj B22 B12) 
(adj B21 B22) (adj B21 B20) (adj B21 B11)
(adj B20 B10) (adj B20 B21)
(adj B12 B22) (adj B12 B02) (adj B12 B11)
(adj B11 B12) (adj B11 B10) (adj B11 B01)(adj B11 B21) 
(adj B10 B00) (adj B10 B20) (adj B10 B11)
(adj B02 B12) (adj B02 B01)
(adj B01 B02) (adj B01 B00) (adj B01 B11) 
(adj B00 B10) (adj B00 B01)



)

(:goal(and (not (notsafecell A11))  (not (notsafecell B20))
))
)