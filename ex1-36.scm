#! /usr/bin/env csi -s

(define (puts x) (begin (display x) (newline)))

(define (average a b) (/ (+ a b) 2))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? x y)
    (< (abs (- x y)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (begin (puts guess)
             (if (close-enough? guess next)
               next
               (try next)))))
  (try first-guess))

(puts (fixed-point (lambda (x) (/ (log 1000) (log x)))
                   4.0))

(newline)
(puts "Average damping:")
(puts (fixed-point (lambda (x) (/ (+ (/ (log 1000) (log x)) x) 2))
                   4.0))
