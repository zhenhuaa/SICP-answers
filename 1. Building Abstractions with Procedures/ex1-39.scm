#! /usr/bin/env csi -s

(define (puts x) (begin (display x) (newline)))

(define (cont-frac n d k)
  (define (cont-frac-helper n d k i)
    (let ( (ni (n i))
          (di (d i)))
      (if (= i k)
        (/ ni di)
        (/ ni (+ di (cont-frac-helper n d k (+ i 1)))))))
  (cont-frac-helper n d k 1))

(define (tan-cf x k)
  (cont-frac (lambda (i)
               (if (= i 1) x (- (* x x))))
             (lambda (i)
               (- (* i 2) 1))
             k))
