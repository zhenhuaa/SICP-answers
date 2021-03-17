#! /usr/bin/env csi -s

(define (count-x x)
  (define (helper n x)
    (cond ((= n 0) 0)
          ((not (= (remainder n x) 0)) 0)
          (else (+ 1 (helper (/ n x) x)))))
  (lambda (n) (helper n x)))

(define (cons x y)
  (* (expt 2 x) (expt 3 y)))

(define (car z)
  ((count-x 2) z))

(define (cdr z)
  ((count-x 3) z))


(display (car (cons 2 3)))
(newline)
(display (cdr (cons 3 4)))
