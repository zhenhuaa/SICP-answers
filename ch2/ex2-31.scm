#! /usr/bin/env csi -q

(define (square x) (* x x))

(define (tree-map proc tree)
  (map (lambda (x)
         (cond ((null? x) x)
               ((number? x) (proc x))
               (else (tree-map proc x))))
       tree))


(define (square-tree tree) (tree-map square tree))

(use test)
(test '(1 (4 (9 16) 25) (36 49)) (square-tree '(1 (2 (3 4) 5) (6 7))))
