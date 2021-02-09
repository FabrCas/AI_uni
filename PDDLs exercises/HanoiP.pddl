(define (problem hanoi)
(:domain hanoi)
(:objects
rod1 rod2 rod3 rod11 rod12 rod13 rod21 rod22 rod23 rod31 rod32 rod33 disk1 disk2 disk3 empty  ;disk3>disk2>disk1

) 
(:init  ;empty in this case is used in tricky manner, let's thing about it like the bigger disk on all rods, as the surface.
;to be updated values
(on rod13 disk1) (on rod12 disk2) (on rod11 disk3)
(on rod21 empty) (on rod31 empty)
 
(upperdisk rod1 disk1) (upperdisk rod2 empty)
(upperdisk rod3 empty)

;fixed values
(disk disk1) (disk disk2) (disk disk3)
;mapping positions 
(downpos rod11 rod11) (downpos rod12 rod11) (downpos rod13 rod12)
(downpos rod21 rod21) (downpos rod22 rod21) (downpos rod23 rod22)
(downpos rod31 rod31) (downpos rod32 rod31) (downpos rod33 rod32)
(upperpos rod11 rod12) (upperpos rod12 rod13) (upperpos rod13 rod13)
(upperpos rod21 rod22) (upperpos rod22 rod23) (upperpos rod23 rod23)
(upperpos rod31 rod32) (upperpos rod32 rod33) (upperpos rod33 rod33)
;relationship of dimension
(graterdisk disk3 disk2) (graterdisk disk3 disk1)  (graterdisk empty disk3)
(graterdisk disk2 disk1) (graterdisk empty disk2)
(graterdisk empty disk1)
)

(:goal (and (on rod33 disk1) (on rod12 disk2) (on rod11 disk3))  ; (on rod33 disk1) (on rod32 disk2) (on rod31 disk3) )
)
)