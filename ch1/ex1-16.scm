#! /usr/bin/env csi -s

(define (fast-expt b n)
  (define (square x) (* x x))
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (fast-expt-iter b n)
  (define (fast-expt-iter-helper acc b n)
    (cond ((= n 0) acc)
          ((odd? n) (fast-expt-iter-helper (* acc b) b (- n 1)))
          (else (fast-expt-iter-helper acc (* b b) (/ n 2)))))
  (fast-expt-iter-helper 1 b n))

(import test)
(test (expt 3 4) (fast-expt 3 4))
(test (expt 3 4) (fast-expt-iter 3 4))
(test (expt 3 9) (fast-expt-iter 3 9))
