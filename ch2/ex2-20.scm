#! /usr/bin/env csi -q

(define (same-parity . items)
  (if (null? items) items
    (let
      ((parity? (if (even? (car items)) even? odd?)))
      (filter parity? items))))

(use test)
(test '(1 3 5 7) (same-parity 1 2 3 4 5 6 7))
(test '(2 4 6) (same-parity 2 3 4 5 6 7))
