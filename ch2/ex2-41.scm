#! /usr/bin/env csi -q

(define nil '())
(define (enumerate-interval beg end)
  (if (> beg end) nil (cons beg (enumerate-interval (+ beg 1) end))))

(define (flat-map proc seq) (fold-right append nil (map proc seq)))

(define (unique-triples n)
  (flat-map append
            (flat-map (lambda (i)
                        (map (lambda (j)
                               (map (lambda (k)
                                      (list k j i))
                                    (enumerate-interval 1 (- j 1))))
                             (enumerate-interval 1 (- i 1))))
                      (enumerate-interval 1 n))))

(define (triples-of-sum n s)
  (filter (lambda (triple)
         (= s (+ (car triple) (cadr triple) (caddr triple))))
       (unique-triples n)))

(use test)
(test '(1 2 3) (enumerate-interval 1 3))
(test '(2 3 4) (enumerate-interval 2 4))
(test '((1 2 3) (1 2 4) (1 3 4) (2 3 4)) (unique-triples 4))
(test '((1 3 4)) (triples-of-sum 4 8))
