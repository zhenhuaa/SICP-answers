#! /usr/bin/env guile
!#

(define (pascal-triangle n)
  (if (= n 1) 1
    (+ (pascal-triangle (- n 1)) n)))

(display (pascal-triangle 4))
