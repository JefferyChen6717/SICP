; recursive
(define (f-recur n d k)
  (define (help n d i k)
    (if (= i k)
	(/ (n i) (d i))
	(/ (n i) (+ (d i) (help n d (+ i 1) k)))))
  (+ (help n d 1 k) 2))

; iterate
(define (f-iter n d k)
  (define (help n d x k)
    (if (= k 0)
	x
	(help n d
	      (/ (n k) (+ (d k) x)) (- k 1))))
  (+ 2 (help n d (/ (n k) (d k)) (- k 1))))

(define (n x) 1.0)
(define (d x)
  (if (= 2 (remainder x 3))
      (* 2.0 (/ (+ x 1.0) 3.0))
      1))

(begin
  (display "recursive:")
  (newline)
  (display (f-recur n d 100))
  (newline)
  (display "iterate:")
  (newline)
  (display (f-iter n d 100))
  (newline))
