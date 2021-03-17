#! /usr/bin/env csi -q

(define x (list 1 2 3))
(define y (list 4 5 6))

(define (puts x) (display x) (newline))
(puts (append x y))
(puts (cons x y))
(puts (list x y))
