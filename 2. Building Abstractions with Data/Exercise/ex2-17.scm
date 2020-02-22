#! /usr/bin/env csi -s

(define (last-pair items)
  (if (null? (cdr items))
    (list (car items))
    (last-pair (cdr items))))

(import test)

(test (list 2) (last-pair (list 1 2)))
(test (list 1) (last-pair (list 1)))
