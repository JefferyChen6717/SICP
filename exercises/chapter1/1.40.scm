; define derivative
(define dx 0.00001)
(define (deriv f)
  (lambda(x)
    (/(- (f (+ x dx)) (f x)) dx)))

; newton's method
(define (newton-method f x0)
  (define (iter x)
    (- x (/ (f x) ((deriv f) x))))
  (define (good? x y) (< (abs (- x y)) 0.0001))
  (define (try x)
    (let ((next (iter x)))
      (if (good? next x)
	  next
	  (try next))))
  (try x0))

; cubic function
(define (cubic a b c)
  (lambda(x) (+ (* x x x) (* a x x) (* b x) c)))

(begin
  (display (newton-method (cubic 1 1 1) 1))
  (newline))
