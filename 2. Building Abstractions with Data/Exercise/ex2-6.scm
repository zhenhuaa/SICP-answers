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

(define (add m n) (lambda (f) (lambda (x) ((m f) ((n f) x)))))

;apply zero and one to add
(lambda (f) (lambda (x) (((lambda (f) (lambda (x) (x))) f) (((lambda (f) (lambda (x) (f x)))f) x))))
(lambda (f) (lambda (x) ((lambda (x) (x)) ((lambda (x) (f x)) x))))
(lambda (f) (lambda (x) ((lambda (x) (x)) (f x))))
(lambda (f) (lambda (x) (f x))) ; got one
