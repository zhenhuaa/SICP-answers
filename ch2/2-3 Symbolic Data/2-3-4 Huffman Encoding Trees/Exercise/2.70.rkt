#lang racket/base
(require "2.68.rkt" "2.69.rkt")

(define rock-lyrics '((a 2) (boom 2) (get 2) (job 2)
                      (na 16) (sha 3) (yip 9) (wah 1)))

(define lyrics-message '(get a job sha na na na wah yip yip sha boom))


(define rock-tree (generate-huffman-tree rock-lyrics))
; (display rock-tree)

(define encode-bits (encode lyrics-message rock-tree))
(display (length encode-bits))

