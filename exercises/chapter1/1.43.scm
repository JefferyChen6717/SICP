(define (repeated f n)
  (if (= n 1) f
    (lambda(x) (f ((repeated f (- n 1)) x)))))

(define (square x) (* x x))

(begin
  (display ((repeated square 2) 5))
  (newline))
