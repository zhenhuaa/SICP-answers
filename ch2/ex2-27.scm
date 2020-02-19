#! /usr/bin/env csi -q

(define (deep-reverse x)
  (if (null? x) x
    (append (deep-reverse (cdr x))
            (list (if (pair? (car x)) (deep-reverse (car x)) (car x))))))

(import test)
(define x (list (list 1 2) (list 3 4)))
(test '((3 4) (1 2)) (reverse x))
(test '((4 3) (2 1)) (deep-reverse x))
