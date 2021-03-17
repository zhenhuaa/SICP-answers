#|
Exercise 2.59: Implement the union-set operation for the unordered-list representation of sets.
|#

(load "../note.scm")

(define (union-set set1 set2)
    [cond ((null? set1) set2)
          ((null? set2) set1)
          ([if (element-of-set? (car set1) set2) 
            (union-set (cdr set1) set2)
            (adjoin-set (car set1) (union-set (cdr set1) set2)) 
          ])
    ])