#! /usr/bin/env csi -qs

(define (accumulate op initial sequence)
  (if (null? sequence) initial (op (car sequence) (accumulate op initial (cdr sequence)))))

(define (count-leaves t)
  (accumulate (lambda (x y) (if (number? x) (+ 1 y) (+ (count-leaves x) y))) 0 t))

(use test)
(test 4 (count-leaves '((1 2) ( 3 4))))
