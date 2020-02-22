(define (interval-width interval)
  (/ (- (upper-bound interval) (lower-bound interval)) 2))


(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))


(interval-width (add-interval x y))
; =>
(interval-width (make-interval (+ (lower-bound x) (lower-bound y))
                               (+ (upper-bound x) (upper-bound y))))
; =>
(/
  (- (upper-bound (make-interval (+ (lower-bound x) (lower-bound y))
                                 (+ (upper-bound x) (upper-bound y))))
     (lower-bound (make-interval (+ (lower-bound x) (lower-bound y))
                                 (+ (upper-bound x) (upper-bound y)))))
  2)
; =>
(/
  (- (+ (upper-bound x) (upper-bound y))
     (+ (lower-bound x) (lower-bound y)))
  2)
; =>
(/
  (+
    (- (upper-bound x) (lower-bound x)
       (- (upper-bound y) (lower-bound y))))
  2)
; =>
(+
  (/ (- (upper-bound x) (lower-bound x)) 2)
  (/ (- (upper-bound y) (lower-bound y)) 2))
; =>
(+ (interval-width x) (interval-width y))

; same as sub-iterval

