#! /usr/bin/env csi -s

(define (average-damp f)
  (define (average x y) (/ (+ x y) 2))
  (lambda (x) (average (f x) x)))

(define (fixed-point f first-guess)
  (define tolerance 0.00001)
  (define (close-enough? x y)
    (< (abs (- x y)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

(define (average-damp f)
  (define (average x y) (/ (+ x y) 2))
  (lambda (x) (average (f x) x)))

(define (compose f g) (lambda (x) (f (g x))))
(define (repeated f n)
  (if (<= n 1) f (compose f (repeated f (- n 1)))))

(define (nth-roots n)
  (lambda (x)
    (fixed-point ((repeated average-damp (- n 1))
                  (lambda (y) (- n 1) (/ x (expt y (- n 1)))))
                 1.0)))


(define (puts x) (begin (display x) (newline)))

(define sqrt (nth-roots 2))
(puts (sqrt 16))
(puts ((nth-roots 4) 625))
