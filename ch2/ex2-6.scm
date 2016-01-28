#! /usr/bin/env csi -s

(define zero (lambda (f) (lambda (x) (x))))
(define (add-one n) (lambda (f) (lambda (x) (f ((n f) x)))))


;apply zero to add-one
(lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) (x))) f) x))))
(lambda (f) (lambda (x) (f ((lambda (x) (x))) x)))
(lambda (f) (lambda (x) (f x)))

(define one (lambda (f) (lambda (x) (f x))))

;apply one to add-one
(lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) (f x))) f) x))))
(lambda (f) (lambda (x) (f ((lambda (x) (f x)) x))))
(lambda (f) (lambda (x) (f (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))

