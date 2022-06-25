(define (f n)
  (define (fraction x) (/ 1 (+ 1 x)))
  (if (= n 0)
      (fraction 1.0)
      (fraction (f (- n 1)))))

(begin
  (display (f 100.0))
  (newline))
