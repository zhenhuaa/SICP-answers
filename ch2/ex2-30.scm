#! /usr/bin/env csi -q

(define (square x) (* x x))
(define (square-tree items)
  (cond ((null? items) items)
        ((number? (car items))
         (cons (square (car items))
               (square-tree (cdr items))))
        (else (cons (square-tree (car items))
                    (square-tree (cdr items))))))

(define (square-tree items)
  (map (lambda (x)
         (cond ((null? x) x)
               ((number? x) (square x))
               (else (square-tree x))))
       items))

(use test)
(test '(1 (4 (9 16) 25) (36 49)) (square-tree '(1 (2 (3 4) 5) (6 7))))
