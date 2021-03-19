#lang racket/base

; Exercise 2.67: Define an encoding tree and a sample message:
(require "../note.rkt" rackunit)

(define sample-tree
  (make-code-tree 
   (leaf 'A 4)
   (make-code-tree
    (leaf 'B 2)
    (make-code-tree 
     (leaf 'D 1)
     (leaf 'C 1)))))

(define sample-message 
  '(0 1 1 0 0 1 0 1 0 1 1 1 0))

(check-equal?
            (decode sample-message sample-tree )
             '(A D A B B C A) )