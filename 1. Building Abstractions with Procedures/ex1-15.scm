#! /usr/bin/env csi -s
(require-extension mathh)

(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
  (if (not (> (abs angle) 0.1)) angle
    (p (sine (/ angle 3.0)))))

(display (sine 12.15))
(display "\n")

(display "Invoke p times: ")
(define (invoke-p n)
  (ceiling ((make-log/base (/ 1 3)) (/ 0.1 n))))
(display (invoke-p 12.15)) 
; a: p is applied 5 times
; b order of growth is log(n)
