(define (f base n)
  (define (fraction x) (/ 1 (+ 1 x)))
  (if (= n 0)
      base
      (f (fraction base) (- n 1))))

(begin
  (display (f 1.0 100.0))
  (newline))
