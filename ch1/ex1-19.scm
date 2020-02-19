#! /usr/bin/env csi -s

; Tpq transform for (a, b)
; a <- bq + aq + ap
; b <- bp + aq

;first transform
; a1 = bq + aq + ap
; b1 = bp + aq

;second transform
; a2 = b1q + a1q + a1p
;    = (bp + aq)q + (bq + aq + ap)q + (bq + aq + ap)p
;    = bpq + aq^2 + bq^2 + aq^2 + apq + bpq + apq + ap^2
;    = b(2pq + q^2) + a(2pq + q^2) + a(p^2 + q^2)

; b2 = b1p + a1q
;    = (bp + aq)p + (bq + aq + ap)q
;    = bp^2  + apq + bq^2 + aq^2 + apq
;    = b(p^2 + q^2) + a(2pq + q^2)

; so:
; p-new = (p^2 + q^2)
; q-new = (2pq + q^2)

;init p= 0 q=0

(define (fib n)
  (define (square x) (* x x))
  (define (new-p-for-even p q) (+ (square p) (square q)))
  (define (new-q-for-even p q) (+ (* 2 p q) (square q)))
  (define (new-a a b p q) (+ (* b q) (* a q) (* a p)))
  (define (new-b a b p q) (+ (* b p) (* a q)))
  (define (fib-iter a b p q count)
    (cond
      ((= count 0) b)
      ((even? count) (fib-iter a b (new-p-for-even p q) (new-q-for-even p q) (/ count 2)))
      (else (fib-iter (new-a a b p q) (new-b a b p q) p q (- count 1)))))
  (fib-iter 1 0 0 1 n))


(import test)
(test 0 (fib 0))
(test 3 (fib 4))
(test 5 (fib 5))

