#! /usr/bin/env csi -s

;   [c1 - c1*d1, c1 + c1*d2]  * [c2 - c2*d2, c2 + c2*d2]
; = [c1c2 - (d1+d2)c1c2 + c1c2d1d2, c1c2 + (d1+d2)c1c2 + c1c2d1d2]
; ~ [c1c2 - (d1+d2)c1c2, c1c2 + (d1+d2)c1c2] (when d1 d2 is very small)
; new percent approximately is about (d1+d2)


(define (make-interval a b) (if (< a b) (cons a b) (cons b a)))
(define (lower-bound interval) (car interval))
(define (upper-bound interval) (cdr interval))
(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (percent x p) (/ (* x p) 100.0))
(define (make-center-percent c p)
  (let ((w (percent c p)))
    (make-center-width c w)))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))


(define (puts x) (begin (display x) (newline)))

(puts (mul-interval (make-center-percent 10 0.01) (make-center-percent 5 0.02)))
(puts (make-center-percent 50 0.03))
