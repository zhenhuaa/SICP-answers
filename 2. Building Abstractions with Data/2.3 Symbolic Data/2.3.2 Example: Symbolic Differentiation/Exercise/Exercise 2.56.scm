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


(load "/Users/zhenhua/learnx/sicp/2. Building Abstractions with Data/2.3 Symbolic Data/2.3.2 Example: Symbolic Differentiation/note.scm")

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


(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
          (make-product 
           (multiplier exp)
           (deriv (multiplicand exp) var))
          (make-product 
           (deriv (multiplier exp) var)
           (multiplicand exp))))

        ((exponentiation? exp) (
            (let ((u (base exp)) (n (exponent exp)))
            (make-product
              (make-product n (make-exponentiation u (- n 1)))
              (deriv u x)
            ))
        ))

        (else (error "unknown expression 
                      type: DERIV" exp))))