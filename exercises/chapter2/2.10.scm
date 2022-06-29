; include 2.07.scm

(define (contains-zero? x)
  (or (= (lower-bound x) 0)
      (= (upper-bound x) 0)
      (and (< (lower-bound x) 0)
           (> (upper-bound x) 0))))

(define (div-interval x y)
  (if (contains-zero? y)
    (display "error: the second interval covers 0")
    ((make-interval
      (min (- (lower-bound x) (upper-bound y))
           (- (lower-bound y) (upper-bound x)))
      (max (- (upper-bound x) (lower-bound y))
           (- (upper-bound y) (lower-bound x)))))))
