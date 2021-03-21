#lang racket/base

(require rackunit)
; Exercise 3.2: In software-testing applications, it is useful to be able to count the number of times a given procedure is called during the course of a computation. Write a procedure make-monitored that takes as input a procedure, f, that itself takes one input. The result returned by make-monitored is a third procedure, say mf, that keeps track of the number of times it has been called by maintaining an internal counter. If the input to mf is the special symbol how-many-calls?, then mf returns the value of the counter. If the input is the special symbol reset-count, then mf resets the counter to zero. For any other input, mf returns the result of calling f on that input and increments the counter. For instance, we could make a monitored version of the sqrt procedure:

(define (make-monitored func)
  (let ([call-count 0])
    (lambda (op)
        (cond [(number? op)
               (begin
                (set! call-count (add1 call-count)))
               (func op)]
            [(eq? op 'how-many-calls?) call-count]
            [(eq? op 'reset-count) (set! call-count 0) call-count]))))

(define s (make-monitored sqrt))

(check-equal? (s 100) 10)
(check-equal? (s 'how-many-calls?) 1)
(check-equal? (s 4) 2)
(check-equal? (s 'how-many-calls?) 2)
(check-equal? (s 'reset-count) 0 "reset count should ok")
(check-equal? (s 'how-many-calls?) 0)