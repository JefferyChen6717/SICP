(define (average-damp f)
  (lambda(x) (/ (+ x (f x)) 2)))

(define (fixed-point f guess)
  (define (good? x y)
    (< (abs (- x y)) 0.0001))
  (define (try guess)
    (let ((next (f guess)))
      (if (good? guess next)
	next
	(try next))))
  (try guess))

(define (repeated f n)
  (if (= n 1)
    f
    (lambda(x)
      (f ((repeated f (- n 1)) x)))))

(define (cube x) (* x x x))

(define (cube-root x)
  (define (help a) (/ x (/ (cube a) a)))
  (fixed-point ((repeated average-damp 2) help) 0.5))

(define (fourth-power x) (* x (cube x)))

(define (fourth-root x)
  (define (help a) (/ x (/ (fourth-power a) a)))
  (fixed-point ((repeated average-damp 3) help) 0.5))

(begin
  (display (fourth-root 3))
  (newline))
