#! /usr/bin/env csi -q

(define (make-vect x y)
  (cons x y))

(define (xcor-vect vect)
  (car vect))

(define (ycor-vect vect)
  (cdr vect))

(define (add-vect v1 v2)
  (make-vect (+ (xcor-vect v1) (xcor-vect v2))
             (+ (ycor-vect v1) (ycor-vect v2))))

(define (sub-vect v1 v2)
  (make-vect (- (xcor-vect v1) (xcor-vect v2))
             (- (ycor-vect v1) (ycor-vect v2))))

(define (scale-vect s v)
  (make-vect (* s (xcor-vect v))
             (* s (ycor-vect v))))

(use test)
(test (make-vect 3 3) (add-vect (make-vect 1 1) (make-vect 2 2)))
(test (make-vect -1 -1) (sub-vect (make-vect 1 1) (make-vect 2 2)))
(test (make-vect 4 4) (scale-vect 4 (make-vect 1 1)))
