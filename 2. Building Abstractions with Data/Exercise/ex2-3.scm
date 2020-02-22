#! /usr/bin/env csi -s

(define (puts x) (begin (display x) (newline)))

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

(define (x-diff-point p1 p2)
  (abs (- (x-point p1) (x-point p2))))

(define (y-diff-point p1 p2)
  (abs (- (y-point p1) (y-point p2))))


(define (rect-circum rect)
  (* 2 (+ (rect-width rect) (rect-height rect))))

(define (rect-area rect)
  (* (rect-width rect) (rect-height rect)))


(define (make-rect left-bottom-point width height)
  (cons left-bottom-point (cons width height)))
(define (rect-width rect) (car (cdr rect)))
(define (rect-height rect) (cdr (cdr rect)))

(define rect1 (make-rect (make-point 0 0) 2 4))
(puts (rect-circum rect1))
(puts (rect-area rect1))

(define (make-rect left-bottom-point right-top-point)
  (cons left-bottom-point right-top-point))
(define (rect-left-bottom-point rect) (car rect))
(define (rect-right-top-point rect) (cdr rect))
(define (rect-width rect) (x-diff-point (rect-left-bottom-point rect) (rect-right-top-point rect)))
(define (rect-height rect) (y-diff-point (rect-left-bottom-point rect) (rect-right-top-point rect)))

(define rect1 (make-rect (make-point 0 0) (make-point 2 4)))
(puts (rect-circum rect1))
(puts (rect-area rect1))
