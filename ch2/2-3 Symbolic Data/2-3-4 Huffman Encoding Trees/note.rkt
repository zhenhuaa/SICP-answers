#lang racket/base
(require rebellion/type/tuple racket/trace)

(provide leaf make-code-tree decode code-tree leaf? code-tree-left code-tree-right leaf-symbol)

; data struture
(define-tuple-type leaf (symbol weight))
(define-tuple-type code-tree (left right symbols weight))

; construct code-tree
(define (make-code-tree left right)
  (code-tree left right (merge-symbols left right) 
             (merge-weight left right)))

(define (merge-symbols left right)
  (append (symbols left) (symbols right)))

(define (merge-weight left right)
  (+ (weight left) (weight right)))

(define (weight tree)
  (if (leaf? tree) (leaf-weight tree)
      (code-tree-weight tree)))

(define (symbols tree)
  (if (leaf? tree) (list (leaf-symbol tree))
      (code-tree-symbols tree)))

; add some unit test for make-code-tree
(require rackunit)
(define tree1 (make-code-tree (leaf 'C 1) (leaf 'D 1)))
(define tree2 (make-code-tree (leaf 'B 3) tree1))
(check-equal? tree1
              (code-tree (leaf 'C 1) (leaf 'D 1) '(C D) 2)
              "Two leaf make code tree should ok")
(check-equal? tree2 (code-tree (leaf 'B 3)
                               (code-tree (leaf 'C 1) (leaf 'D 1)
                                          '(C D) 2)
                               '(B C D) 5)
              "Tree and leaf should make tree")

; The decoding procedure
; It takes as arguments a list of zeros and ones, together with a Huffman tree.
(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits) '()
        (let ([next-branch
               (choose-branch
                (car bits)
                current-branch)])
          (if (leaf? next-branch)
              (cons (leaf-symbol next-branch)
                    (decode-1 (cdr bits) tree))
              (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree))

(define (choose-branch bit branch)
  (cond [(= bit 0) (code-tree-left branch)]
        [(= bit 1) (code-tree-right branch)]
        [else (error "bad bit: CHOOSE-BRANCH" bit)]))

; (trace decode)
(check-equal? (decode '(0) tree2) '(B) "should equal B")
(check-equal? (decode '(1 1) tree2) '(D) "1 1 should equal D")



; sets of weighted elements
(define (adjoin-set x set)
  (cond [(null? set) (list x)]
        [(< (weight x) (weight (car set))) (cons x set)]
        [else (cons (car set) (adjoin-set x (cdr set)))]))

(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ([pair (car pairs)])
        (adjoin-set
            (leaf (car pair)
                    (cadr pair))
            (make-leaf-set (cdr pairs))))))

(define leaf-pairs '((A 4) (B 2) (C 1) (D 1)))
(define expect-leaf-set (list (leaf 'D 1) (leaf 'C 1) (leaf 'B 2) (leaf 'A 4)))
(check-equal? (make-leaf-set leaf-pairs) expect-leaf-set "should make leaf-pairs succ")