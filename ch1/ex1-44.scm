#! /usr/bin/env csi -s

(define (average . numbers)
  (/ (apply + numbers) (length numbers)))

(define (square x) (* x x))
(define (compose f g) (lambda (x) (f (g x))))

(define dx 0.000001)
(define (repeated f n)
  (if (<= n 1) f (compose f (repeated f (- n 1)))))
(define (smooth f)
  (lambda (x) (average (f (- x dx)) (f x) (f (+ x dx)))))

(import test)
(test 4.0 (((repeated smooth 10) (lambda (x) (* 2 x))) 2))
(test #f (= 4 (((repeated smooth 1) square) 2)))
