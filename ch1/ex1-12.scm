#! /usr/bin/env csi -s

; row and col all start with 1
(define (pascal-triangle row col)
  (cond ((= row col) 1)
        ((or (< col 1) (> col row)) 0)
        (else (+ (pascal-triangle (- row 1) (- col 1)) (pascal-triangle (- row 1) (+ col))))))

(use test)
(test 1 (pascal-triangle 2 1))
(test 2 (pascal-triangle 3 2))
