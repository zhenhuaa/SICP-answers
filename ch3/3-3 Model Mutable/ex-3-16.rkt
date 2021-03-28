#lang racket
; Exercise 3.16: Ben Bitdiddle decides to write a procedure to count the number of pairs in any list 
; structure. “It’s easy,” he reasons. “The number of pairs in any structure is the number in the car 
; plus the number in the cdr plus one more to count the current pair.” So Ben writes the following 
; procedure:

(require rackunit r5rs)

(define (count-pairs x)
    (if (not (pair? x))
        0
        (+ (count-pairs (car x))
           (count-pairs (cdr x))
           1)))

; Show that this procedure is not correct. In particular, draw box-and-pointer diagrams representing
; list structures made up of exactly three pairs for which Ben’s procedure would return 3; return 4;
; return 7; never return at all.


(check-equal? (count-pairs '(1 2 3)) 3 "should equal")

(define x '(x))
(define y (cons x x))
(define l4 (list y))

(display l4)
(check-equal? (count-pairs l4) 4 "should equal 4")

(define l7 (cons y y))
(check-equal? (count-pairs l7) 7 "should equal 7")

(define str4 '(foo bar baz))
(set-cdr! (cddr str4) str4)
(count-pairs str4)