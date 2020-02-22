; normal list

(define true #t)
(define false #f)

(define (element-of-set? x set) 
    (cond ((null? set) #f)
    ((equal? x (car set)) #t)
    (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set) 
    (if (element-of-set? x set)
        set
        (cons x set)))

(define (intersection-set set1 set2)
    (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
        (cons (car set1) (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

; order set
(define (element-of-order-set? x set) 
    (cond ((null? set) false)
    ((= x (car set)) true)
    ((< x (car set)) false)
    (else (element-of-set? x (cdr set)))))

(define adjoin-order-set adjoin-set)

(define (intersection-order-set set1 set2) 
    (if (or (null? set1) (null? set2))
    '()
    (let ((x1 (car set1)) (x2 (car set2)))
    [cond ((= x1 x2) (cons x1 (intersection-set (cdr set1) (cdr set2))))
            ((< x1 x2) (intersection-set (cdr set1) set2))
            ((< x2 x1) (intersection-set set1 (cdr set2)))
    ])))


; binary trees
(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree)) 
(define (right-branch tree) (caddr tree)) 
(define (make-tree entry left right)
    (list entry left right))

(define adjoin-tree-set adjoin-set)

(define (adjoin-tree-set x set)
    [cond ((null? set) (make-tree x '() '()))

        ((= x (entry set)) set)

        ((< x (entry set)) 
            (make-tree (entry set) 
            (adjoin-tree-set x (left-branch set)) (right-branch set))) 

        ((> x (entry set)) 
            (make-tree (entry set) 
            (left-branch set) (adjoin-set x (right-branch set))))
        ])

