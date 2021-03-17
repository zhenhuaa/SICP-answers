#! /usr/bin/env csi -s

(define (square x) (* x x))
(define (inc x) (+ x 1))

(define (compose f g) (lambda (x) (f (g x))))

(import test)
(test 49 ((compose square inc) 6))
