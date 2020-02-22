(load "Exercise 2.56.scm")

(import test)



(test-group "function deriv"
  [test "d(x+3)/dx should be 1" 1 [deriv '(+ x 3) 'x]]
  [test "dxy/dx should be y" 'y [deriv '(* x y) 'x]]
  [test "d(xy*(x+3)/dx) should be (xy + y*(x+3))" '(+ (* x y) (* y (+ x 3))) [deriv '(* (* x y) (+ x 3)) 'x]]
  [test "d(x**0)/dx should be 0" 0 [deriv '(** x 0) 'x]]
  [test "d(x**1)/dx should be 1" 1 [deriv '(** x 1) 'x]]
  [test "d(x**5)/dx should be x**4" '(* 5 (** x 4)) [deriv '(** x 5) 'x]]

  [test "is exponentiation" #t [exponentiation? '(** x 2)]]
)


(test-exit)