#lang racket/base
; Exercise 3.3: Modify the make-account procedure so that it creates password-protected accounts. That is, make-account should take a symbol as an additional argument, as in

; The resulting account object should process a request only if it is accompanied by the password with which the account was created, and should otherwise return a complaint:

(require rackunit)

(define (make-account balance password)
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
        (cond [(eq? m 'withdraw) withdraw]
              [(eq? m 'deposit) deposit]
              [else (error "Unknown request: 
                    MAKE-ACCOUNT" m)])
        (error "Incorrect password")))
  dispatch)


(define acc (make-account 100 'secret-password))

(check-equal? ((acc 'secret-password 'withdraw) 40) 60)