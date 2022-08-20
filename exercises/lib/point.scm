(define (make-point x y) (cons x y))
(define (x-point x) (car x))
(define (y-point x) (cdr x))

(define (print-point p)
  (begin
    (display "(")
    (display (x-point p))
    (display ", ")
    (display (y-point p))
    (display ")")
    (newline)))
