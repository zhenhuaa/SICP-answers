#! /usr/bin/env csi -s

(define (sum term a next b)
  (define (iter a result)
    (if (> a b) result (iter (next a) (+ result (term a)))))
  (iter a 0))


; test
(define (identity x) x)
(define (inc x) (+ x 1))
(define (sum-integers a b)
  (sum identity a inc b))

(import test)
(test 15 (sum-integers 1 5))
(test 55 (sum-integers 1 10))
