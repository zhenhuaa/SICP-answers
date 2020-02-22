[toc]

## Representing Sets
That is, we define “set” by specifying the operations that are to be
used on sets. These are union-set, intersection-set, element-of-
set?, and adjoin-set. 


### Sets as unordered lists

#### element-of-set
```lisp
(define (element-of-set? x set) 
    (cond ((null? set) false)
    ((equal? x (car set)) true)
    (else (element-of-set? x (cdr set)))))
```
#### adjoin-set
```lisp
(define (adjoin-set x set) 
    (if (element-of-set? x set)
      set
      (cons x set)))
```

#### intersection-set 
```lisp
(define (intersection-set set1 set2)
    (cond ((or (null? set1) (null? set2)) '())
    ((element-of-set? (car set1) set2)
    (cons (car set1) (intersection-set (cdr set1) set2)))
    (else (intersection-set (cdr set1) set2))))
```