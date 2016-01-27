#! /usr/bin/env csi -s

(define (double f) (lambda (x) (f (f x))))

(define (inc x) (+ x 1))

(use test)
(test 2 ((double inc) 0))
(test 21 (((double (double double)) inc) 5))
