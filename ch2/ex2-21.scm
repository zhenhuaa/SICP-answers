#! /usr/bin/env csi -q

(define (square-list items) (map (lambda (x) (* x x)) items))

(use test)
(test '(1 4 9 16) (square-list '(1 2 3 4)))
