(load "Exercise 2.58 Part B.scm")


(import test)


(test-group "func deriv"
  [test 4 [deriv '(x + 3 * (x + y + 2)) 'x] ]
  [test 1 [deriv '(x + 3 * y + z) 'x]]
  [test '((x * y) + (y * (x + 3))) [deriv '((x * y) * (x + 3)) 'x]]
)

(test-exit)