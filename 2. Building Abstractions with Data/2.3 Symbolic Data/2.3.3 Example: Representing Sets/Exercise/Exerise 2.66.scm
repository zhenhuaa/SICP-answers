#|
Exercise 2.66: Implement the lookup procedure for the case 
where the set of records is structured as a binary tree, 
or- dered by the numerical values of the keys.
|#

(load "../note.scm")
(load "Exercise 2.64.scm")

(define (lookup2 given-key set-of-records) 
    (if (null? set-of-records) #f
        [let [(record (entry set-of-records))]
           [cond ((= given-key  (key record)) record)
                    ((< given-key (key record)) (lookup2 given-key (left-branch set-of-records)))
                    (else (lookup2 given-key (right-branch set-of-records)))]]
))

(import test)

[test #f (lookup2 1 (list->tree (list '(2 2) '(3 3))))]
[test (record 3 3) (lookup2 3 (list->tree (list '(2 2) '(3 3))))]

(test-exit)

