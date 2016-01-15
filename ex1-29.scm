#! /usr/bin/env csi -s

(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a) (sum term (next a) next b))))

(define (inc x) (+ x 1))

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (term-coefficient n) (if (even? n) 2 4))
  (define (simpson-term n)
    (* (term-coefficient n) (f (+ a (* n h)))))
  (* (/ h 3) (sum simpson-term 0 inc n)))

(define (cube x) (* x x x))
(display (simpson cube 0 1 100))
(newline)
(display (simpson cube 0 1 1000))
