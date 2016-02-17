#lang racket
(require sicp-pict)

(define wave einstein)
(paint wave)

(define wave2 (beside wave (flip-vert wave)))
(paint wave2)

(define wave4 (below wave2 wave2))
(paint wave4)

(define (flipped-pairs painter)
  (let ((painter2 (beside painter (flip-vert painter))))
    (below painter2 painter2)))

(paint (flipped-pairs wave))

(define (right-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (right-split painter (- n 1))))
        (beside painter (below smaller smaller)))))
(paint (right-split wave 4))

(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
        (below painter (beside smaller smaller)))))

(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left (beside up up))
              (bottom-right (below right right))
              (corner (corner-split painter (- n 1))))
          (beside (below painter top-left)
                  (below bottom-right corner))))))
(paint (corner-split wave 4))

(define (square-limit painter n)
  (let ((quarter (corner-split painter n)))
    (let ((half (beside (flip-horiz quarter) quarter)))
      (below (flip-vert half) half))))
(paint (square-limit wave 4))

(define (split op1 op2 )
  (define (split-helper painter n)
    (if (= n 0)
        painter
        (let ((smaller (split-helper painter (- n 1))))
          (op1 painter (op2 smaller smaller)))))
  (lambda (painter n) (split-helper painter n)))



(define right-split-2 (split beside below))
(define up-split-2 (split below beside))
(paint (up-split-2 wave 4))