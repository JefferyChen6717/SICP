(define (compose f g) (lambda(x) (f (g x))))

(define (square x) (* x x))
(define (inc x) (+ x 1))

(begin
  (display ((compose square inc) 6))
  (newline))
