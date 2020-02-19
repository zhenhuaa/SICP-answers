#! /usr/bin/env csi -q

(define nil '())
(define (enumerate-interval beg end)
  (if (> beg end) nil (cons beg (enumerate-interval (+ beg 1) end))))
(define (flatmap proc seq) (fold-right append nil (map proc seq)))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
      (list empty-board)
      (filter
        (lambda (positions) (safe? k positions))
        (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(define empty-board '())
(define (adjoin-position new-row k rest-of-queens)
  (cons (cons new-row k) rest-of-queens))


(define (same-row? p1 p2) (= (car p1) (car p2)))
(define (same-diagonal? p1 p2) (= 1 (abs (/ (- (car p1) (car p2)) (- (cdr p1) (cdr p2))))))

(define (position-check? p1 p2)
  (or (same-row? p1 p2)
      (same-diagonal? p1 p2)))

(define (safe? k positions)
  (let ((k-queen-position (car positions))
        (rest-queen-positions (cdr positions)))
    (not (any (lambda (position)
                (position-check? position k-queen-position))
              rest-queen-positions))))


(import test)
(test 1 (length (queens 1)))
(test 2 (length (queens 4)))
(test 92 (length (queens 8)))
