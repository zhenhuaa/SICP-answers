#! /usr/bin/env csi -s

(define (make-interval a b) (if (< a b) (cons a b) (cons b a)))
(define (lower-bound interval) (car interval))
(define (upper-bound interval) (cdr interval))

(define (interval-positive? x) (> (lower-bound x) 0))
(define (interval-negative? x) (< (upper-bound x) 0))
(define (interval-span-zero? x) (and (not (interval-positive? x)) (not (interval-negative? x))))



(define (mul-interval x y)
  (cond
    ((and (interval-negative? x) (interval-negative? y))
     (make-interval (* (upper-bound x) (upper-bound y)) (* (lower-bound x) (lower-bound y))))
    ((and (interval-negative? x) (interval-span-zero? y))
     (make-interval (* (lower-bound x) (upper-bound y)) (* (lower-bound x) (lower-bound y))))
    ((and (interval-negative? x) (interval-positive? y))
     (make-interval (* (lower-bound x) (upper-bound y)) (* (upper-bound x) (lower-bound y))))

    ((and (interval-span-zero? x) (interval-negative? y))
     (make-interval (* (upper-bound x) (lower-bound y)) (* (lower-bound x) (lower-bound y))))
    ((and (interval-span-zero? x) (interval-span-zero? y))
     (make-interval
       (min (* (lower-bound x) (upper-bound y))  (* (upper-bound x) (lower-bound y)))
       (max (* (lower-bound x) (lower-bound y)) (* (upper-bound x) (upper-bound y)))))
    ((and (interval-span-zero? x) (interval-positive? y))
     (make-interval (* (lower-bound x) (upper-bound y)) (* (upper-bound x) (upper-bound y))))

    ((and (interval-positive? x) (interval-negative? y))
     (make-interval (* (upper-bound x) (lower-bound y)) (* (lower-bound x) (upper-bound y))))
    ((and (interval-positive? x) (interval-span-zero? y))
     (make-interval (* (upper-bound x) (lower-bound y)) (* (upper-bound x) (upper-bound y))))
    ((and (interval-positive? x) (interval-positive? y))
     (make-interval (* (lower-bound x) (lower-bound y)) (* (upper-bound x) (upper-bound y))))))

(use test)
(test (make-interval 2 8) (mul-interval (make-interval 1 2) (make-interval 2 4)))
(test (make-interval -16 8) (mul-interval (make-interval -2 4) (make-interval -4 2)))
(test (make-interval  -4 8) (mul-interval (make-interval -2 4) (make-interval 1 2)))
