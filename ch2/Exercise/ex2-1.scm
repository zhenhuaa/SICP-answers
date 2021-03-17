#! /usr/bin/env csi -s

(define (numer x) (car x))
(define (denom x) (cdr x))

(define (make-rat n d)
  (let ((g (gcd n d)))
    (if (or (and (> n 0) (< d 0)) (and (< n 0) (< d 0)))
      (cons (- (/ n g)) (- (/ d g)))
      (cons (/ n g)  (/ d g)))))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(print-rat (make-rat -2 4))
(print-rat (make-rat 2 -4))
(print-rat (make-rat -2 -4))
(print-rat (make-rat 2 4))
