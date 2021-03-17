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
Θ(n ** 2)
```lisp
(define (intersection-set set1 set2)
    (cond ((or (null? set1) (null? set2)) '())
    ((element-of-set? (car set1) set2)
    (cons (car set1) (intersection-set (cdr set1) set2)))
    (else (intersection-set (cdr set1) set2))))
```

### Sets as ordered lists
One way to speed up our set operations is to change the representation so that the set elements are listed in increasing order. 

```lisp
(define (element-of-set? x set) 
    (cond ((null? set) false)
    ((= x (car set)) true)
    ((< x (car set)) false)
    (else (element-of-set? x (cdr set)))))

```

intersection-set Θ(n) growth version
```lisp Θ(n) 
(define (intersection-set set1 set2) 
    (if (or (null? set1) (null? set2)) '()
        (let ((x1 (car set1)) (x2 (car set2)))
            (cond ((= x1 x2)
            (cons x1 (intersection-set (cdr set1) (cdr set2))))
            ((< x1 x2) (intersection-set (cdr set1) set2))
            ((< x2 x1) (intersection-set set1 (cdr set2)))))))
```

### Sets as binary tree
Since the size of the tree is halved at each step, we should
expect that the number of steps needed to search a tree of size n grows as Θ(logn).

```lisp
(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree)) 
(define (right-branch tree) (caddr tree)) 
(define (make-tree entry left right) (list entry left right))
```