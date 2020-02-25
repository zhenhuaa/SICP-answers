#|
Exercise 2.65: Use the results of Exercise 2.63 and Exercise 2.64 to give Θ(n) 
implementations of union-set and
intersection-set for sets implemented as (balanced) binary trees.
|#

(load "Exercise 2.63.scm")
(load "Exercise 2.64.scm")

(define (union-tree-set set1 set2) (list->tree (union-order-set (tree->list-1 set1 ) (tree->list-1 set2))))
(define (intersection-tree-set set1 set2) (list->tree (intersection-order-set (tree->list-1 set1 ) (tree->list-1 set2))))


(import test)


(test-group "function union-tree-set"
    [test (list->tree '(1 2 3)) (union-tree-set (list->tree '(1 2)) (list->tree '(2 3)))]
    [test (list->tree '(1 2 3 4)) (union-tree-set (list->tree '(1 2 3)) (list->tree '(2 3 4)))]
    [test (list->tree '(2 3)) (intersection-tree-set (list->tree '(1 2 3)) (list->tree '(2 3 4)))]
)
