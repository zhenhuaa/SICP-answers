#! /usr/bin/env csi -s

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

(define (puts x) (begin (display x) (newline)))

(define dx 0.00001)
(define (deriv g)
  (lambda (x) (/ (- (g (+ x dx)) (g x)) dx)))


(define (cube x) (* x x x))
(puts ((deriv cube) 5))  ;approach 75

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (newton-method g guess)
  (fixed-point (newton-transform g) guess))

(define (sqrt x) (newton-method (lambda (y) (- (square y) x)) 1.0))
(puts (sqrt 4))


(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))


(define (average-damp f)
  (define (average x y) (/ (+ x y) 2))
  (lambda (x) (average (f x) x)))

(define (sqrt x)
  (fixed-point-of-transform (lambda (y) (/ x y)) average-damp 1.0))
(puts (sqrt 4))

(define (sqrt x)
  (fixed-point-of-transform  (lambda (y) (- x (square y))) newton-transform 1.0))
(puts (sqrt 4))
