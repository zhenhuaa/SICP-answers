#! /usr/bin/env csi -q

(define (square x) (* x x))
(define (square-list items)
  (cond ((null? items) items)
        ((number? (car items))
         (cons (square (car items))
               (square-list (cdr items))))
        (else (cons (square-list (car items))
                    (square-list (cdr items))))))

(define (square-list items)
  (map (lambda (x)
         (cond ((null? x) x)
               ((number? x) (square x))
               (else (square-list x))))
       items))

(use test)
(test '(1 (4 (9 16) 25) (36 49)) (square-list '(1 (2 (3 4) 5) (6 7))))
