#! /usr/bin/env csi -s

(define (make-interval a b) (cons a b))
(define (lower-bound interval) (car interval))
(define (upper-bound interval) (cdr interval))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x (make-interval (/ 1.0 (upper-bound y)) (/ 1.0 (lower-bound y)))))

(use test)
(test (make-interval 2 8) (mul-interval (make-interval 1 2) (make-interval 2 4)))
(test (make-interval 2.0 8.0) (div-interval (make-interval 1 2) (make-interval 0.5 0.25)))

(define (div-interval x y)
  (if (and (<= (lower-bound x)) (>= (upper-bound y))) (error "divisor interval spans zero!")
    (mul-interval x (make-interval (/ 1.0 (upper-bound y)) (/ 1.0 (lower-bound y))))))

(test (make-interval 2.0 8.0) (div-interval (make-interval 1 2) (make-interval -0.5 0.25)))
