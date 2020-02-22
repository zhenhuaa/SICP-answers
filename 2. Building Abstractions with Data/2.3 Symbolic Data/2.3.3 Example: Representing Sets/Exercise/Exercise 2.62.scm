#|
Exercise 2.62: Give a Θ(n) implementation of union-set for sets represented as ordered lists.
|#

(load "../note.scm")

(define (union-order-set set1 set2) 
    [cond ((null? set1) set2)
        ((null? set2) set1)
        (else [let ((e1 (car set1)) (e2 (car set2))) 
            [cond ((= e1 e2) (cons e1 (union-order-set (cdr set1) (cdr set2))))
                    ((< e1 e2) (cons e1 (union-order-set (cdr set1) set2)))
                    ((> e1 e2) (cons e2 (union-order-set set1 (cdr set2))))
            ]])
])


; test
(import test)
; (import trace)
; (trace union-order-set)
[test '(1 2 3) (union-order-set '(1 2) '(2 3))]
[test '(1 2 3 4) (union-order-set '(1 2 3) '(2 3 4))]

(test-exit)