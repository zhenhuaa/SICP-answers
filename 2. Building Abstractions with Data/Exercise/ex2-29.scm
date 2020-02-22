#! /usr/bin/env csi -q

(define (make-mobile left right)
  (list left right))

(define (make-branch len structure)
  (list len structure))

;a
(define (left-branch m) (car m))
(define (right-branch m) (car (cdr m)))
(define (branch-length b) (car b))
(define (branch-structure b) (car (cdr b)))

;b
(define (total-weight-branch b)
  (let ((s (branch-structure b)))
    (if (number? s) s (total-weight s))))

(define (total-weight m)
  (+ (total-weight-branch (left-branch m))
     (total-weight-branch (right-branch m))))

(define (torque b)
  (* (total-weight-branch b) (branch-length b)))

;c
(define (branch-mobile-balance? b)
  (let ((s (branch-structure b)))
    (if (number? s) #t (mobile-balance? s))))

(define (mobile-balance? m)
  (and (= (torque (left-branch m)) (torque (right-branch m)))
       (branch-mobile-balance? (left-branch m))
       (branch-mobile-balance? (right-branch m))))

;d
(define (make-mobile left right) (cons left right))
(define (make-branch len structure) (cons len structure))
(define (left-branch m) (car m))
(define (right-branch m) (cdr m))
(define (branch-length b) (car b))
(define (branch-structure b) (cdr b))

(import test)
(define b1 (make-branch 2 1))
(define b2 (make-branch 1 2))
(define m1 (make-mobile b1 b2))

(define b3 (make-branch 2 m1))
(define b4 (make-branch 3 2))
(define m2 (make-mobile b3 b4))

(test 3 (total-weight m1))
(test 5 (total-weight m2))
(test #t (mobile-balance? m1))
(test #t (mobile-balance? m2))
