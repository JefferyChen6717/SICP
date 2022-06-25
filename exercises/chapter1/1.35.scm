(define tolerance 0.00001)

(define (fix-point f guess)
  (define (good? x y) (< (abs(- x y)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (good? guess next)
	  next
	  (try next))))
  (try guess))

(begin
  (display (fix-point (lambda(x) (+ 1 (/ 1 x))) 1.0))
  (newline))
