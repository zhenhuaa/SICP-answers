#lang racket
(require rebellion/type/record)

(define-record-type opcode (name argument addressing-mode))
(define add-42
  (opcode #:name 'ADD
          #:argument 42
          #:addressing-mode 'immediate))

(define-record-type color (red green blue))