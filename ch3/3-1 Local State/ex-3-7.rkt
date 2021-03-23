#lang racket/base

; Consider the bank account objects created by make-account, with the password modification described in Exercise 3.3. Suppose that our banking system requires the ability to make joint accounts. Define a procedure make-joint that accomplishes this. Make-joint should take three arguments. The first is a password-protected account. The second argument must match the password with which the account was defined in order for the make-joint operation to proceed. The third argument is a new password. Make-joint is to create an additional access to the original account using the new password. For example, if peter-acc is a bank account with password open-sesame, then will allow one to make transactions on peter-acc using the name paul-acc and the password rosebud. You may wish to modify your solution to Exercise 3.3 to accommodate this new feature.


(require "ex-3-3.rkt" rackunit racket/trace)


(define (make-joint account pwd pwd2) 
    (define (joint-account password op) 
        (if (eq? password  pwd2) (account pwd op)
            (error "Incorrect password")))
        (begin ((account pwd 'deposit) 0) ; do clever check
            joint-account))

(define peter-acc (make-account 100 'open-sesame))

(define paul-acc
  (make-joint peter-acc 
              'open-sesame 
              'rosebud))

(check-equal? ((peter-acc 'open-sesame 'withdraw) 10) 90)
(check-equal? ((paul-acc 'rosebud 'withdraw) 10) 80)
(check-equal? ((peter-acc 'open-sesame 'deposit) 0) 80)