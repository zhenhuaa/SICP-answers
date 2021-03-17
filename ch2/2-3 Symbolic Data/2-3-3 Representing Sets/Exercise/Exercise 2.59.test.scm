(load "Exercise 2.59.scm")
(import test)

(test-group "function union-set"
    [test '(1 2 3) (union-set '(1 2) '(2 3))]
    [test '(1 2 3 4) (union-set '(1 2 3) '(2 3 4))]
)


(test-exit)