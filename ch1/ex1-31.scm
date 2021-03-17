#! /usr/bin/env csi -s

(define (identity x) x)
(define (inc n) (+ n 1))

(define (product term a next b)
  (if (> a b) 1
    (* (term a) (product term (next a) next b))))


(define (factorial n)
  (product identity 1 inc n))

(import test)
(test 6 (factorial 3))
(test 24 (factorial 4))

(define (cal-pi n)
  (define (term n)
    (/ (* (- n 1) (+ n 1)) (* n n)))
  (define (next n) (+ n 2))
  (* 4 (product term 3 next n)))

(display (cal-pi 1000))
(newline)



(define (product term a next b)
  (define (iter a result)
    (if (> a b) result (iter (next a) (* (term a) result))))
  (iter a 1))
(display (cal-pi 1000))
