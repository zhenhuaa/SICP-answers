#! /usr/bin/env csi -s

(define (sum-integers a b)
  (if (> a b)
    0
    (+ a (sum-integers (+ a 1) b))))

(define (cube x) (* x x x))
(define (sum-cubes a b)
  (if (> a b)
    0
    (+ (cube a) (sum-cubes (+ a 1) b))))

(define (pi-sum a b)
  (if (> a b)
    0
    (+ (/ 1.0 (* a (+ a 2)))
       (pi-sum (+ a 4) b))))

(use test)
(test 15 (sum-integers 1 5))
(test 36 (sum-cubes 1 3))
(test #t (< (abs (- 3.14 (* 8 (pi-sum 1 3000)))) 0.1))

(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a) (sum term (next a) next b))))

(define (inc n) (+ n 1))
(define (sum-cubes a b)
  (sum cube a inc b))

(define (identity x) x)
(define (sum-integers a b)
 (sum identity a inc b))
(test 15 (sum-integers 1 5))
(test 36 (sum-cubes 1 3))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b) dx))

(test #t (< (abs (- (integral cube 0 1 0.01) 0.24)) 0.01))
