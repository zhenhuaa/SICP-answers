#! /usr/bin/env csi -q

(define nil '())
(define (reverse seq)
  (fold-right (lambda (x y) (append y (list x))) nil seq))

(use test)
(test '(1 2) (reverse (reverse '(1 2))))
(test '(1 2 3 4) (reverse (reverse '(1 2 3 4))))

(define (reverse seq)
  (define fold-left fold)
  (fold-left (lambda (x y) (cons x y)) nil seq))

(use test)
(test '(1 2) (reverse (reverse '(1 2))))
(test '(1 2 3 4) (reverse (reverse '(1 2 3 4))))
