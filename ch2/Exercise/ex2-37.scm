#! /usr/bin/env csi -qs

(define (accumulate op initial sequence)
  (if (null? sequence) initial (op (car sequence) (accumulate op initial (cdr sequence)))))


(define (dot-product v w) (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product x v)) m))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
    '()
    (cons (accumulate op init (map car seqs))
          (accumulate-n op init (map cdr seqs)))))

(define (transpose m)
  (accumulate-n cons '() m))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (v) (matrix-*-vector cols v)) m)))

(import test)
(define m1 '((1 2 3 4) (4 5 6 6) (6 7 8 9)))
(define m2 '((1 2) (3 4)))
(test 8 (dot-product '(1 2) '(2 3)))
(test '(10 21 30) (matrix-*-vector m1 '(1 1 1 1)))
(test m1 (transpose (transpose m1)))
(test '((10 10) (21 21) (30 30)) (matrix-*-matrix m1 '((1 1) (1 1) (1 1) (1 1))))
(test '((7 10) (15 22)) (matrix-*-matrix m2 m2))
