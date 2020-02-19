#! /usr/bin/env csi -s


(define (accumulate combiner null-value term a next b)
  (if (> a b)
    null-value
    (combiner (term a) (accumulate combiner null-value term (next a) next b))))

(define (product term a next b)
  (accumulate * 1 term a next b))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (inc n) (+ n 1))
(define (identity x) x)
(define (sum-integers a b)
  (sum identity a inc b))
(define (factorial n)
  (product identity 1 inc n))

(import test)
(test 15 (sum-integers 1 5))
(test 24 (factorial 4))

(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b) result (iter (next a) (combiner (term a) result))))
  (iter a null-value))

(import test)
(test 15 (sum-integers 1 5))
(test 24 (factorial 4))
