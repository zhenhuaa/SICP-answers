#! /usr/bin/env csi -s

(define (make-interval a b) (if (< a b) (cons a b) (cons b a)))
(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (percent x p) (/ (* x p) 100.0))

(define (make-center-percent c p)
  (let ((w (percent c p)))
    (make-center-width c w)))

(display (make-center-percent 100 1))
