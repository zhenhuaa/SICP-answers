#! /usr/bin/env csi -q

(define nil '())
(define (reverse seq)
  (fold-right (lambda (x y) (append y (list x))) nil seq))

(define (fold-left op initial seq)
  (define (iter result rest)
    (if (null? rest)
      result
      (iter (op result (car rest)) (cdr rest))))
  (iter initial seq))

(import test)
(test '(1 2) (reverse (reverse '(1 2))))
(test '(1 2 3 4) (reverse (reverse '(1 2 3 4))))

(define (reverse seq)
  (fold-left (lambda (result first) (cons first result))nil seq))

(import test)
(test '(1 2) (reverse (reverse '(1 2))))
(test '(1 2 3 4) (reverse (reverse '(1 2 3 4))))
