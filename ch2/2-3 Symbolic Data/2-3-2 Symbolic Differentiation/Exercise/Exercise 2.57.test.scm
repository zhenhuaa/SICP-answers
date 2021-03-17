(load "Exercise 2.57.scm")
(import test)

(test-group "function augend"
  [test "augend for two terms" 2 [augend '(+ 1 2)]]
  [test "augend ok for three terms" '(+ 2 3) [augend '(+ 1 2 3)]]
  [test "multiplicand ok for more terms" '(* 2 3 4 5) [multiplicand '(* 1 2 3 4 5)]]
  [test "should deriv success" '(+ (* x y) (* y (+ x 3))) [deriv '(* x y (+ x 3)) 'x] ]
)

(test-exit)