#|
Show how to extend the basic differentiator to handle more kinds of expressions. 
For instance, implement the differentiation rule
d(u^n) /dx =nu^(n−1)du /dx
by adding a new clause to the deriv program and defining appropriate 
procedures exponentiation?, base, exponent, and make-exponentiation. 
(You may use the symbol ** to denote exponentiation.) 
Build in the rules that anything raised to the power 0 is 1 and 
anything raised to the power 1 is the thing itself.
|#


(define (exponentiation? x) (and (pair? x) (eq? (car x) '**)))

; The base is the second item of the sum list:
(define (base s) (cadr s))

; The exponent is the third item of the sum list:
(define (exponent s) (caddr s))

(define (make-exponentiation base exponent) 
    [cond ((=number? exponent) 0)
          ((=number> exponent 1), base)
          (else (list '** base exponent))
    ])