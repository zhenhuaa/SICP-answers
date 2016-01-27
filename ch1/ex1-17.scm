#! /usr/bin/env csi -s

(define (* a b)
  (if (= b 0)
    0
    (+ a (* a (- b 1)))))

(define (fast-multi a b)
  (cond ((= b 1) a)
        ((even? b) (fast-multi (+ a a) (/ b 2)))
        (else (+ a (fast-multi a (- b 1))))))

(use test)
(test 12 (* 3 4))
(test 12 (fast-multi 3 4))
