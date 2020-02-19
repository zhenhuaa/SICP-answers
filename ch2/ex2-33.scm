#! /usr/bin/env csi -qs

(define (accumulate op initial sequence)
  (if (null? sequence) initial (op (car sequence) (accumulate op initial (cdr sequence)))))

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) '() sequence))

(define (append-2 seq1 seq2)
  (accumulate cons seq2 seq1))

(define (length-2 sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))

(import test)
(test '(1 4 9) (map (lambda (x) (* x x)) (list 1 2 3)))
(test '(1 2 3 4) (append-2 '(1 2) '(3 4)))
(test 4 (length-2 '(1 2 3 4)))
