#! /usr/bin/env csi -q


(define (fringe x)
  (cond ((null? x) x)
        ((number? x) (list x))
        (else (append (fringe (car x))
                      (fringe (cdr x))))))

(use test)
(define x '((1 2) (3 4)))
(test '(1 2 3 4) (fringe x))
