#lang racket/base
; Exercise 3.8: When we defined the evaluation model in 1.1.3, we said that the first step in evaluating an expression is to evaluate its subexpressions. But we never specified the order in which the subexpressions should be evaluated (e.g., left to right or right to left). When we introduce assignment, the order in which the arguments to a procedure are evaluated can make a difference to the result. Define a simple procedure f such that evaluating

; will return 0 if the arguments to + are evaluated from left to right but will return 1 if the arguments are evaluated from right to left.

; (+ (f 0) (f 1))

; order left -> right = 0
; 0 (f 0)  = 0
; 1 (f 1)  = 0

; order right => left => 1
; 0 (f 1) = 1
; 1 (f 0) = 1

(require racket/trace rackunit)

(define make-f 
    (λ () 
        (let ([i 0]) 
        (λ (n) 
            (begin (set! i (+ i 1)) (if (>= (- i n) 2) 1 0))))))

(define f1 (make-f))
(define f2 (make-f))

(check-equal? (+ (f1 0) (f1 1)) 0 "left->right")
(check-equal? (+ (f2 1) (f2 0)) 1 "right->left")