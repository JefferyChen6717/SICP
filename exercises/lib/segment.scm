(define (make-segment x y)
  (cons x y))

(define (start-segment x) (car x))
(define (end-segment x) (cdr x))

(define (print-segment x)
  (begin
    (display "start-point: ")
    (print-point (start-segment x))
    (display "end-point: ")
    (print-point (end-segment x))))
