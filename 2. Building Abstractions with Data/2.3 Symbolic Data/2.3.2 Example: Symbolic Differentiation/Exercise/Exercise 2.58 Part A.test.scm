(load "Exercise 2.58 Part A.scm")


(import test)

(test-group "function deriv-a"
  [test "it d(x+3)/dx should be 1" 1 [deriv '(x + 3) 'x] ]
  [test "it dxy/dx should be y" 'y [deriv '(x * y) 'x]]
  [test "it d(xy*(x+3)/dx) should be (xy + y*(x+3))" '((x * y)  + (y * (x + 3))) [deriv '((x * y) * (x + 3)) 'x]]
)

(test-exit)