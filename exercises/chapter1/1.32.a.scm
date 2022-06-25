(define (accumulate combiner base func next a b)
  (if (> a b)
      base
      (combiner (func a)
		(accumulate combiner base func next (next a) b))))

(begin
  (display
    (accumulate (lambda(x y) (+ x y))
		0
		(lambda(x) x)
		(lambda(x) (+ x 1))
		1
		3))
  (newline))
