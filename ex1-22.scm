#! /usr/bin/env csi -s
(use srfi-19)

(define (square x) (* x x))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((= (remainder n test-divisor) 0) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (runtime)
  (time->milliseconds (current-time)))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n) (report-prime n (- (runtime) start-time))))

(define (report-prime n elapsed-time)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time))


(define (search-for-primes start end)
  (define (next-odd n) (if (odd? n) n (+ 1 n)))
  (define (s-f-p start end)
    (if (<= start end) (begin (timed-prime-test start) (s-f-p (+ 2 start) end))))
  (s-f-p (next-odd start) end))

(search-for-primes 1000000000 1000000021)
(newline)
(search-for-primes 10000000000 10000000061)
(newline)
(search-for-primes 100000000000 100000000057)
(newline)
(search-for-primes 1000000000000 1000000000063)


; sample output

; 1000000007 *** 15
; 1000000009 *** 17
; 1000000021 *** 15
;
; 10000000019 *** 49
; 10000000033 *** 50
; 10000000061 *** 53
;
; 100000000003 *** 162
; 100000000019 *** 161
; 100000000057 *** 159
;
; 1000000000039 *** 516
; 1000000000061 *** 519
; 1000000000063 *** 507

; YES, time const increases roughly of a factor of 3(sqrt(10))
