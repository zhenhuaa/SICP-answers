#! /usr/bin/env csi -s

(define (puts x) (begin (display x) (newline)))

(define (square x) (* x x))

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

(define (newton-method g guess)
  (define (deriv g)
    (define dx 0.00001)
    (lambda (x) (/ (- (g (+ x dx)) (g x)) dx)))
  (define (newton-transform g)
    (lambda (x)
      (- x (/ (g x) ((deriv g) x)))))
  (fixed-point (newton-transform g) guess))


(define (cubic a b c)
  (lambda (x) (+ (* x x x) (* a (square x)) (* b x) c)))

(puts (newton-method (cubic 0 0 -27) 1))
(puts (newton-method (cubic 1 1 -100) 1))
