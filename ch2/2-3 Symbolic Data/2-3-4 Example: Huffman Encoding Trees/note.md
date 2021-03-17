In general, if we want to distinguish n different symbols, we will need to use log2n bits per symbol.

Codes such as ASCII and the A-through-H code above are known as fixed-length codes

Another solution is to design the code in such a way that no complete code for any symbol 
is the beginning (or prefix) of the code for another symbol. Such a code is called a prefix code. 

A Huffman code can be represented as a binary tree whose leaves are the symbols that are encoded. 
At each non-leaf node of the tree there is a set containing all the symbols in the leaves that lie below the node

Each time we move down a le branch we add a 0 to the code, and each time we move down a right branch we add a 1.

## Generating Huffman trees
Arrange the tree so that the symbols with the lowest frequency appear farthest away from the root. 

## Representing Huffman trees
```lisp
(define (make-leaf symbol weight) (list 'leaf symbol weight)) 
(define (leaf? object) (eq? (car object) 'leaf))
(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))

(define (make-code-tree left right) (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))


(define (left-branch tree) (car tree)) 
(define (right-branch tree) (cadr tree)) 

(define (symbols tree)
    (if (leaf? tree)
    (list (symbol-leaf tree)) (caddr tree)))

(define (weight tree) 
    (if (leaf? tree)
        (weight-leaf tree) 
        (cadddr tree)))
```

## The decoding procedure

```lisp
(define (decode bits tree)
    (define (decode-1 bits current-branch)
        (if (null? bits) '()
        (let ((next-branch
        (choose-branch (car bits) current-branch)))
        (if (leaf? next-branch)
        (cons (symbol-leaf next-branch)
        (decode-1 (cdr bits) tree)) (decode-1 (cdr bits) next-branch)))))
(decode-1 bits tree))

(define (choose-branch bit branch)
    (cond ((= bit 0) (left-branch branch))
    ((= bit 1) (right-branch branch))
    (else (error "bad bit: CHOOSE-BRANCH" bit))))
```

## Sets of weighted elements

```lisp
(define (adjoin-set x set) (cond ((null? set) (list x))
    ((< (weight x) (weight (car set))) (cons x set))
    (else (cons (car set)
    (adjoin-set x (cdr set))))))


(define (make-leaf-set pairs) (if (null? pairs)
    '()
    (let ((pair (car pairs))) ; symbol
    (adjoin-set (make-leaf (car pair) (cadr pair)) ; frequency
    (make-leaf-set (cdr pairs))))))

```
