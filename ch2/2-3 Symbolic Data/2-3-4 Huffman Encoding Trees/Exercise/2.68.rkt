#lang racket/base
; Exercise 2.68: The encode procedure takes as arguments a
; message and a tree and produces the list of bits that gives the
; encoded message.

(require "../note.rkt" "2.67.rkt" rackunit racket/trace)

(define (encode message tree)
  (if (null? message)
      '()
      (append 
       (encode-symbol (car message) 
                      tree)
       (encode (cdr message) tree))))

#|
Encode-symbol is a procedure, which you must write, that returns
the list of bits that encodes a given symbol according to a given tree.
You should design encode-symbol so that it signals an error
if the symbol is not in the tree at all.
Test your procedure by encoding the result you obtained in Exercise 2.67
with the sample tree and seeing whether it is the same as the original sample message.
|#
(define (encode-symbol symbol tree)
  (cond
        [(null? tree) '()]
        [(leaf? tree) '()]
        [(eq? (leaf-symbol (code-tree-left tree)) symbol) '(0)]
        [else (cons 1 (encode-symbol symbol (code-tree-right tree)))]))

(define sample-symbols (decode sample-message sample-tree))


(check-equal? (encode sample-symbols sample-tree) sample-message)
(check-equal? (decode (encode sample-symbols sample-tree) sample-tree)
              sample-symbols
              "should encode then decode valid")