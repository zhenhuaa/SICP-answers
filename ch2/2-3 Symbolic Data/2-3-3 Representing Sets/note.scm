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

(define (union-order-set set1 set2) 
    [cond ((null? set1) set2)
        ((null? set2) set1)
        (else [let ((e1 (car set1)) (e2 (car set2))) 
            [cond ((= e1 e2) (cons e1 (union-order-set (cdr set1) (cdr set2))))
                    ((< e1 e2) (cons e1 (union-order-set (cdr set1) set2)))
                    ((> e1 e2) (cons e2 (union-order-set set1 (cdr set2))))
            ]])
])



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



; Sets and information retrieval
(define (key record) (car record))
(define (record a b) (list a b))

(define (lookup given-key set-of-records) 
    [cond ((null? set-of-records) false)
          ((equal? given-key (key (car set-of-records))) (car set-of-records))
          (else (lookup given-key (cdr set-of-records)))])