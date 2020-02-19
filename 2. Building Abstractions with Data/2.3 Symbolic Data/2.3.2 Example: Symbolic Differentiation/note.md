[toc]
## Differentiation program

### Math:
    1. dc / dx = 0
    2. dx / dx = 1
    4. d(u+v)/dx = du / dx + dv / dx
    5. d(uv)/dx = u * dv / dx + v * du / dx

### Wishful thinking
```lisp
(variable? e)          ;Is e a variable?
(same-variable? v1 v2) ;Are v1 and v2 the same variable?
(sum? e)               ;Is e a sum?
(addend e)             ;Addend of the sum e.
(augend e)             ;Augend of the sum e.
(make-sum a1 a2)       ;Construct the sum of a1 and a2.
(product? e)           ;Is e a product?”
(multiplier e)         ;Multiplier of the product e.
(multiplicand e)       ;Multiplicand of the product e.
(make-product m1 m2)   ;Construct the product of m1 and m2.”
```

### Procedure
```lisp
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
        (else (error "unknown expression 
                      type: DERIV" exp))))
```

### Representing algebraic expressions
* The variables are symbols
```lisp
  (define (variable? x) (symbol? x))
```
* Two variables are them same 
```lisp
(define (same-variable? v1 v2)
  (and (variable? v1)
      (variable? v2)
      (eq? v1 v2)))
```
* Sums and products are constructed as lists:
```lisp
(define (make-sum a1 a2) (list '+ a1 a2)) 
(define (make-product m1 m2) (list '* m1 m2))
```
* A sum is a list whose first element is the symbol +:
```lisp
(define (sum? x) (and (pair? x) (eq? (car x) '+)))
```
* The addend is the second item of the sum list:
```lisp
(define (addend s) (cadr s))
```

* The augend is the third item of the sum list:
```lisp
(define (augend s) (caddr s))
```

* A product is a list whose first element is the symbol *:
```lisp
(define (product? x) (and (pair? x) (eq? (car x) '*)))
```

* The multiplier is the second item of the product list:
```lisp
(define (multiplier p) (cadr p))
```

* The multiplicand is the third item of the product list:
```lisp
(define (multiplicand p) (caddr p))
```





