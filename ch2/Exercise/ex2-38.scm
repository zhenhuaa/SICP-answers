#! /usr/bin/env csi -q

(define (fold-left op initial seq)
  (define (iter result rest)
    (if (null? rest)
      result
      (iter (op result (car rest)) (cdr rest))))
  (iter initial seq))

(import test)

(define nil '())
(test 1.5 (fold-right / 1 '(1 2 3)))
(test (/ 1 6) (fold-left / 1 (list 1 2 3)))
(test '(1 (2 (3 ()))) (fold-right list nil '(1 2 3)))
(test '(((() 1) 2) 3) (fold-left list nil '(1 2 3)))


; (op a b) === (op b a)
