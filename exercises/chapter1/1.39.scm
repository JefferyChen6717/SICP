(define (tan x k)
  (define (n x k) (if (= k 1) x (* x x)))
  (define (d k) (- (* 2 k) 1))
  (define (help i)
    (if (= i k)
	(/ (n x i) (d i))
	(/ (n x i) (- (d i) (help (+ i 1))))))
  (help 1))

(begin
  (display (tan (/ 3.14159 4) 100))
  (newline))
