#|

Exercise 2.63: Each of the following two procedures converts a binary tree to a list.

a. Do the two procedures produce the same result for
every tree? If not, how do the results differ? What lists

b. Do the two procedures have the same order of growth in the number of
 steps required to convert a balanced tree with n elements to a list? 
 If not, which one grows more slowly?

|#

(load "../note.scm")
(import trace)

(define (tree->list-1 tree) 
    (if (null? tree) '()
    (append (tree->list-1 (left-branch tree))
        (cons (entry tree) (tree->list-1
        (right-branch tree))))))

(define (tree->list-2 tree)
    (define (copy-to-list tree result-list) 
        (if (null? tree) result-list
            (copy-to-list (left-branch tree)
                (cons (entry tree) 
                      (copy-to-list (right-branch tree) result-list)))))
    (trace copy-to-list)
    (copy-to-list tree '()))

(define fig2-16-1 '(7 (3 (1 () ()) (5 () ())) (9 () (11 () ())))) 
(define fig2-16-2 '(3 (1 () ()) (7 (5 () ()) (9 () (11 () ()))))) 
(define fig2-16-3 '(5 (3 (1 () ()) ()) (9 (7 () ()) (11 () ())))) 

; test
; (trace tree->list-1)
; (trace tree->list-2)
; (tree->list-1 fig2-16-1)

