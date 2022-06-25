(define (product func next a b)
  (if (> a b)
      1
      (* (func a) (product func next (next a) b))))

(define (pi k)
  (define (next x) (+ x 2.0))
  (define (func x) (* (/ (- x 1.0) x) (/ (+ x 1) x)))
  (product func next 3 k))

(begin
  (display (* (pi 9999) 4))
  (newline))
