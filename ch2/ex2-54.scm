#! /usr/bin/env csi -s

(define (puts x) (display x) (newline))

(define (equal? x y)
  (cond ((and (atom? x) (atom? y))
         (eq? x y))
        ((and (list? x) (list? y))
         (and (equal? (car x) (car y)) (equal? (cdr x) (cdr y))))
        (else #f)))


(use test)
(test #t (equal? '(this is a list) '(this is a list)))
(test #f (equal? '(this is a list) '(this (is a) list)))
