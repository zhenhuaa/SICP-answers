#! /usr/bin/env csi -q

(define nil '())
(define (enumerate-interval beg end)
  (if (> beg end) nil (cons beg (enumerate-interval (+ beg 1) end))))

(define (unique-pairs n) (flat-map
                           (lambda (i) (map (lambda (j) (list i j)) (enumerate-interval 1 (- i 1))))
                           (enumerate-interval 1 n)))

(define (flat-map proc seq) (fold-right append nil (map proc seq)))

(import test)
(test '(1 2 3) (enumerate-interval 1 3))
(test '(2 3 4) (enumerate-interval 2 4))
(test '((2 1) (3 1) (3 2)) (unique-pairs 3))

(define (prime-sum-pairs n)
  (map make-pair-sum (filter prime-sum? (unique-pairs n))))


