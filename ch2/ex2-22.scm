#! /usr/bin/env csi -q

(define (square x) (* x x))

(define (list-push items x)
  (if (null? items) (list x)
    (cons (car items) (list-push (cdr items) x))))

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
      answer
      (iter (cdr things) (list-push answer (square (car things))))))

  (iter items '()))

(import test)
(test '(1 4 9 16) (square-list '(1 2 3 4)))
