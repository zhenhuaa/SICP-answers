#! /usr/bin/env csi -s

(define (puts x) (begin (display x) (newline)))

(define (iterate-improve good-enough? next-guess)
  (define (helper guess)
    (if (good-enough? guess) guess (helper (next-guess guess))))
  (lambda (guess) (helper guess)))


(define (average a b) (/ (+ a b) 2))
(define (sqrt x)
  (define (good-enough? guess) (< (abs (- (* guess guess) x)) 0.001))
  (define (next-guess guess) (average (/ x guess) guess))
  ((iterate-improve good-enough? next-guess) 1))
(puts (sqrt 2))


(define (fixed-point f first-guess)
  (define tolerance 0.00001)
  (define (good-enough? guess)
    (< (abs (- guess (next-guess guess))) tolerance))
  (define (next-guess guess) (f guess))
  ((iterate-improve good-enough? next-guess) first-guess))

(define (average-damp f)
  (lambda (x) (average (f x) x)))

(define (sqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y))) 1.0))
(puts (sqrt 2))
