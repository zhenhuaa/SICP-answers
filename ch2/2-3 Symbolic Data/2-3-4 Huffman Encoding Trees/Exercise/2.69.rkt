#lang racket/base 

; The following procedure takes as its argument a list of symbol-frequency pairs (where no symbol appears in more than one pair) and generates a Huffman encoding tree according to the Huffman algorithm.
; Make-leaf-set is the procedure given above that transforms the list of pairs into an ordered set of leaves. Successive-merge is the procedure you must write, using make-code-tree to successively merge the smallest-weight elements of the set until there is only one element left, which is the desired Huffman tree. (This procedure is slightly tricky, but not really complicated. If you find yourself designing a complex procedure, then you are almost certainly doing something wrong. You can take significant advantage of the fact that we are using an ordered set representation.)


(require "../note.rkt" rackunit racket/trace)

(define (generate-huffman-tree pairs)
  (successive-merge 
   (make-leaf-set pairs)))


(define (successive-merge leaf-set)
  (cond
    [(null? leaf-set) '()]
    [(= (length leaf-set) 1) (car leaf-set)]
    [else (let ([sub-tree (make-code-tree (car leaf-set) (cadr leaf-set))]
                [remain-set (cddr leaf-set)])
            (successive-merge (adjoin-set sub-tree remain-set)))]))

(define leaf-pairs '((E 4) (F 3) (G 2) (H 1)))

(display (generate-huffman-tree leaf-pairs))