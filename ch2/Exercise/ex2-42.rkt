#lang racket/base
(require rackunit)

(define nil '())
(define (enumerate-interval beg end)
  (if (> beg end) nil (cons beg (enumerate-interval (+ beg 1) end))))
(define (flatmap proc seq) (foldr append null (map proc seq)))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
      (list empty-board)
      (filter
        (λ (positions) (safe? k positions))
        (flatmap
          (λ (rest-of-queens)
            (map (λ (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(define empty-board '())
(define (adjoin-position new-row k rest-of-queens)
  (cons (cons new-row k) rest-of-queens))


(define (same-row? p1 p2) (= (car p1) (car p2)))
(define (same-diagonal? p1 p2)
  (= 1
    (abs (/ (- (car p1) (car p2))
            (- (cdr p1) (cdr p2))))))

(define (position-check? p1 p2)
  (or (same-row? p1 p2)
      (same-diagonal? p1 p2)))

(define (safe? k positions)
  (let ((k-queen-position (car positions))
        (rest-queen-positions (cdr positions)))
    (not (ormap (λ (position)
                (position-check? position k-queen-position))
              rest-queen-positions))))


(check-equal? (length (queens 1)) 1 "1 queens")
(check-equal? (length (queens 4)) 2 "4 queens")
(check-equal? (length (queens 8)) 92 "8 queues")