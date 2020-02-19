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

(define (n x) 1.0)
(define (d x)
  (if (= (remainder (- x 2) 3) 0)
    (* 2 (+ 1 (/ (- x 2) 3)))
    1))

(import test)
(test 1 (d 1))
(test 2 (d 2))
(test 1 (d 3))
(test 1 (d 4))
(test 4 (d 5))
(test 1 (d 6))


(define e (+ 2 (cont-frac n d 10000)))
(puts e)
