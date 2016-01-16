#! /usr/bin/env csi -s

(define (square x) (* x x))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((= (remainder n test-divisor) 0) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (inc n) (+ n 1))

(define (identity x) x)

(define (gcd a b) (if (= b 0) a (gcd b (remainder a b))))

(define (filtered-accumulate filter combiner null-value term a next b)
  (define (new-term n)
    (if (filter n) (term n) null-value))
  (if (> a b)
    null-value
    (combiner (new-term a) (filtered-accumulate filter combiner null-value term (next a) next b))))

;a
(define (sum-of-prime a b)
  (filtered-accumulate prime? + 0 identity a inc b))

(use test)
(test (+ 1 2 3 5 7) (sum-of-prime 1 10))



;b
(define (product-of-prime n)
  (define (relative-prime? i)
    (= (gcd n i) 1))
  (filtered-accumulate relative-prime?  * 1 identity 1 inc n))

(test (* 1 5) (product-of-prime 6))
