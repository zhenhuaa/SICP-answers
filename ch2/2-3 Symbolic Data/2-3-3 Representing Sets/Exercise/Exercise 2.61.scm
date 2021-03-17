#|
Exercise 2.61: Give an implementation of adjoin-set us- ing the ordered representation. 
By analogy with element- of-set? show how to take advantage of the ordering to produce a procedure that 
requires on the average about half as many steps as with the unordered representation.
|#

(load "../note.scm")

(define (adjoin-order-set x set) 
    [cond ((null? set) '(x))
    ((<= x (car set)) (cons x set))
    (else (cons (car set) (adjoin-order-set x (cdr set))))
])


; test
(import test)
[test '(1 2 3 10) (adjoin-order-set 1 '(2 3 10))]
[test '(2 3 5 10) (adjoin-order-set 5 '(2 3 10))]
(test-exit)
