(load "./note.scm")


(import test)
(import srfi-1)
(import (chicken pretty-print))

; (test 1 (deriv '(+ x 3) 'x) "x+3")
; (test (deriv '(* x y) 'x) 'y)
; (test (deriv '(* (* x y) (+ x 3)) 'x)   '(+ (* x y) (* y (+ x 3))))

(display [deriv '(* (* x y) (+ x 3)) 'x])

(test-group "function deriv"
  [test "test d(x+3)/dx should be 1" 1 [deriv '(+ x 3) 'x]]
  [test "test dxy/dx should be y" 'y [deriv '(* x y) 'x]]
  [test "test d(xy*(x+3)/dx) should be (xy + y*(x+3))" '(+ (* x y) (* y (+ x 3))) [deriv '(* (* x y) (+ x 3)) 'x]]
)

(test-exit)