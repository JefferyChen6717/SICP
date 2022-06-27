(define (make-seg x y)
  (cons x y))
(define (start-seg x) (car x))
(define (end-seg x) (cdr x))

(define (make-poi x y)
  (cons x y))
(define (x-poi x) (car x))
(define (y-poi x) (cdr x))

(define (midpoint-seg x)
  (define (half x) (/ x 2))
  (let ((start (start-seg x))
        (end (end-seg x)))
    (make-poi
      (half (+ (x-poi start) (x-poi end)))
      (half (+ (y-poi start) (y-poi end))))))

(define (print-poi p)
  (begin
    (display "(")
    (display (x-poi p))
    (display ", ")
    (display (y-poi p))
    (display ")")
    (newline)))

(define seg
  (make-seg
    (make-poi 4 4)
    (make-poi 8 8)))

(print-poi
  (midpoint-seg seg))
