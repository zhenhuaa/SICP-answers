#lang racket/base

; Exercise 2.67: Define an encoding tree and a sample message:
(require "../note.rkt" rackunit)

(provide sample-tree sample-message)

(define sample-tree
  (make-code-tree 
   (make-leaf 'A 4)
   (make-code-tree
    (make-leaf 'B 2)
    (make-code-tree 
     (make-leaf 'D 1)
     (make-leaf 'C 1)))))

(define sample-message 
  '(0 1 1 0 0 1 0 1 0 1 1 1 0))

(check-equal?
 (decode sample-message sample-tree)
 '(A D A B B C A))