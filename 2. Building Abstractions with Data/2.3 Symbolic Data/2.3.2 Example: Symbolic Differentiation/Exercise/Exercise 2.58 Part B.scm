(load "../note.scm")
(import srfi-1)

(define (eq-op? op) [lambda (e) (eq? op e)])
(define (list-ele-index ele list) [list-index (eq-op? ele) list])

(define (getop exp) 
[cond ((memq '+ exp) '+)
      ((memq '* exp) '*)
])

(define (lhs exp op) 
[let ((i (list-ele-index op exp)))
    [let ((r (take exp i)))
       (if (= (length r) 1) (car r) r)
    ]
])


(define (rhs exp op) 
[let ((i (list-ele-index op exp)))
    [let ((r (drop exp (+ i 1))))
       (if (= (length r) 1) (car r) r)
    ]
])

(define (make-sum a1 a2) (list a1 '+ a2)) 
(define (sum? x) 
    (and (pair? x) (eq? (getop x) '+)))
(define (addend s) (lhs s '+))
(define (augend s) (rhs s '+))
(define (make-sum a1 a2) 
    [cond ((=number? a1 0) a2) 
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list a1 '+ a2))
    ])


(define (product? x) (and (pair? x) (eq? (getop x) '*)))
(define (multiplier p) (lhs p '*))
(define (multiplicand p) (rhs p '*))
(define (make-product m1 m2)
  [cond ((or (=number? m1 0) (=number? m2 0)) 0)
  ((=number? m1 1) m2)
  ((=number? m2 1) m1)
  ((and (number? m1) (number? m2)) (* m1 m2)) 
  (else (list m1 '*  m2))])