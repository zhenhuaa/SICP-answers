#! /usr/bin/env csi -s

(define (make-segment start end)
  (cons start end))

(define (start-segment seg)
  (car seg))

(define (end-segment seg)
  (cdr seg))

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))


(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (midpoint-segment seg)
  (midpoint (start-segment seg) (end-segment seg)))

(define (average x y) (/ (+ x y) 2))

(define (midpoint p1 p2)
  (make-point (average (x-point p1) (x-point p2))
              (average (y-point p1) (y-point p2))))


(define p1 (make-point 0 0))
(define p2 (make-point 2 2))
(define seg1 (make-segment p1 p2))
(print-point p1)
(print-point p2)
(print-point (midpoint-segment seg1))

