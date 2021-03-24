#lang racket/base

; Exercise 3.13: Consider the following make-cycle procedure, which uses the last-pair procedure defined in Exercise 3.12:
(require rackunit r5rs racket/trace "ex-3-12.rkt")

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define z (make-cycle (list 'a 'b 'c)))

(display z)

; (display (last-pair z)) ;infinite loop