#! /usr/bin/env guile
!#

(define (f n)
  (if (< n 3) n
    (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))

(define (f2 n)
  (define (f-iter a b c n)
    (if (= n 2) c
      (f-iter b c (+ (* a 3) (* 2 b) c) (- n 1))))
  (if (< n 3) n
    (f-iter 0 1 2 n)))

(display "By Recursive\n")
(display (f 10))
(display "By Iterate\n")
(display (f2 10))
