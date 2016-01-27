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

(puts (cont-frac (lambda (i) 1.0)
                 (lambda (i) 1.0) 10))
(puts (cont-frac (lambda (i) 1.0)
                 (lambda (i) 1.0) 100))

(define (cont-frac-iter n d k)
  (define (iter i result)
    (let ( (ni (n i))
          (di (d i)))
      (if (= i 0) result
        (iter (- i 1)
              (/ ni (+ di result))))))
  (iter k 0))

(newline)
(puts "Iterative process")
(puts (cont-frac-iter (lambda (i) 1.0)
                      (lambda (i) 1.0) 10))
(puts (cont-frac-iter (lambda (i) 1.0)
                      (lambda (i) 1.0) 100))
