#! /usr/bin/env csi -s

(define (puts x) (begin (display x) (newline)))

(define (average a b) (/ (+ a b) 2))

(define (search f neg-point pos-point)
  (define (close-enough? x y) (< (abs (- x y)) 0.001))
  (let ((midpoint (average neg-point pos-point)))
    (if (close-enough? neg-point pos-point) midpoint
      (let ((test-value (f midpoint)))
        (cond
          ((positive? test-value) (search f neg-point midpoint))
          ((negative? test-value) (search f midpoint pos-point))
          (else midpoint))))))


(define (half-interval-method f a b)
  (let ((a-value (f a))
        (b-value (f b)))
    (cond ((and (negative? a-value) (positive? b-value)) (search f a b))
          ((and (negative? b-value) (positive? a-value)) (search f b a))
          (else (error "Values are not of opposite sign" a b)))))

(puts (half-interval-method sin 2.0 4.0))
(puts (half-interval-method
        (lambda (x)
          (- (* x x x) (* 2 x) 3))
        1.0 2.0))

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? x y)
    (< (abs (- x y)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

(puts (fixed-point cos 1.0))
(puts (fixed-point (lambda (x) (+ (sin x) (cos x))) 1.0))

(define (sqrt x)
  (fixed-point (lambda (y) (average y (/ x y))) 1.0))

(puts (sqrt 2))
