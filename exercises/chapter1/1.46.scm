(define (iterative-improve good improve)
  (lambda(x)
    (let ((next (improve x)))
      (if (good x next)
          next
          ((iterative-improve good improve) next)))))

(define (good x y) (> (abs (- x y)) 10))

(define (improve x) (* x x))

(begin
  (display
    ((iterative-improve good improve) 2))
  (newline))
