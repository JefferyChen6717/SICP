(define (sum func next a b)
  (define (iter a res)
    (if (> a b)
	res
	(iter (next a) (+ res (func a)))))
  (iter a 0))

(begin
  (display (sum (lambda(x) x) (lambda(x) (+ x 1)) 1 3))
  (newline))
