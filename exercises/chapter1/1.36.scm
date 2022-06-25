(define tolerance 0.00001)

(define (fixed-point f guess)
  (define (good? x y) (< (abs (- x y)) tolerance))
  (define (try guess)
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (good? guess next)
	  next
	  (try next))))
  (try 2))

(define (f x) (/ (log 1000) (log x)))

(define (f1 x) (/ (+ x (f x)) 2.0))

(begin (display "common:") (newline))

(fixed-point f 2)

(begin (display "average:") (newline))

(fixed-point f1 2)
