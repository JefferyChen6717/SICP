(define (accumulate combiner base func next a b)
  (define (iter a res)
    (if (> a b)
	res
	(iter (next a) (combiner res (func a)))))
  (iter a base))

(begin
  (display (accumulate
	     (lambda(x y) (+ x y))
	     0
	     (lambda(x) x)
	     (lambda(x) (+ x 1))
	     1
	     3))
  (newline))
