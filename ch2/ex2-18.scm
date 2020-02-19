#! /usr/bin/env csi -s

(define (list-push items x)
  (if (null? items) (list x)
    (cons (car items) (list-push (cdr items) x))))

(define (list-reverse items)
  (if (null? items) items
    (list-push (list-reverse (cdr items)) (car items))))


(import test)
(test (list 1 2) (list-push (list 1) 2))
(test (list) (list-reverse (list)))
(test (list 1) (list-reverse (list 1)))
(test (list 25 16 9 4 1) (list-reverse (list 1 4 9 16 25)))
