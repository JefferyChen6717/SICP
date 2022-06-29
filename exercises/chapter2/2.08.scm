; include 2.07.scm

(define (sub-interval x y)
   (make-interval
     (min (- (lower-bound x) (upper-bound y))
          (- (lower-bound y) (upper-bound x)))
     (max (- (upper-bound x) (lower-bound y))
          (- (upper-bound y) (lower-bound x)))))
