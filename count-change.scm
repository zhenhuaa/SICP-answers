#! /usr/bin/env guile
!#

(define (cc amount) 
  (define (count-change amount n)
     (cond ((= amount 0) 1)
           ((or (< amount 0) (< n 1)) 0)
           (else (+ (count-change (- amount (first-denomination n)) n) (count-change amount (- n 1))))))

   (define (first-denomination kind-of-coins)
     (cond ((= kind-of-coins 5) 50)
           ((= kind-of-coins 4) 25)
           ((= kind-of-coins 3) 10)
           ((= kind-of-coins 2) 5)
           ((= kind-of-coins 1) 1)))
   (count-change amount 5))

(display (cc 100))
