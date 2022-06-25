(define (product func next a b)
  (define (iter a res)
    (if (> a b)
	res
	(iter (next a) (* res (func a)))))
  (iter a 1))

(begin
  (display (product (lambda(x) (* x x))
		    (lambda(x) (+ x 1))
		    1
		    3))
  (newline))
