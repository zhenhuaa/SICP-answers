#lang racket/base
(require rackunit)
; Exercise 3.4: Modify the make-account procedure of Exercise 3.3 by adding another local state variable so that, if an account is accessed more than seven consecutive times with an incorrect password, it invokes the procedure error-try.

(define MAX_ERROR_TRYS 1)

(define (make-account balance password)
  (define error-try 0)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance 
                     (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch pwd m)
    (if (eq? pwd password)
        (if (<= error-try MAX_ERROR_TRYS)
            (cond [(eq? m 'withdraw) withdraw]
              [(eq? m 'deposit) deposit]
              [else (error "Unknown request: 
                    MAKE-ACCOUNT" m)])
            (error "Max try reached, call the ops"))
        (begin (set! error-try (add1 error-try))
          (error "Incorrect password"))))
  dispatch)


(define acc (make-account 100 'secret-password))