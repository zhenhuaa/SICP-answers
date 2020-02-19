#! /usr/bin/env csi -q

(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-frame frame)
  (list-ref frame 0))

(define (edge1-frame frame)
  (list-ref frame 1))

(define (edge2-frame frame)
  (list-ref frame 2))

(import test)
(define f (make-frame 1 2 3))
(test 1 (origin-frame f))
(test 2 (edge1-frame f))
(test 3 (edge2-frame f))

(define (make-frame origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (origin-frame frame)
  (car frame))

(define (edge1-frame frame)
  (cadr frame))

(define (edge2-frame frame)
  (cddr frame))

(define f (make-frame 1 2 3))
(test 1 (origin-frame f))
(test 2 (edge1-frame f))
(test 3 (edge2-frame f))
