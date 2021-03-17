#! /usr/bin/env csi -s

(define (puts x) (display x) (newline))

(puts (list 'a 'b 'c))
(puts (list (list 'george)))
(puts (cdr '((x1 x2) (y1 y2))))
(puts (cadr '((x1 x2) (y1 y2))))
(puts (pair? (car '(a short list))))
(puts (memq 'red '((red shose) (blue socks))))
(puts (memq 'red '(red shose blue socks)))
