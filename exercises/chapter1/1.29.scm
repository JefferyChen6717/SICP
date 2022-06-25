(define (sum func next a b)
  (if (> a b)
      0
      (+ (func a) (sum func next (next a) b))))

(define (tompson f a b n)
  (define h (/ (- b a) n))
  (define (yk k) (f (+ a (* k h))))
  (define (inc k) (+ k 1))
  (define (co k)
    (cond ((or (= k 0) (= k n)) 1)
	  ((even? k) 2)
	  (else 4)))
  (define (func k) (* (co k) (yk k)))
  (define (help k)
    (* (/ h 3) (sum func inc k n)))
  (help 0))

(define (sq x) (* x x))

(define (cube x) (* (sq x) x))

(begin
  (display (tompson sq 0 1 100))
  (newline))

(begin
  (display (tompson cube 0 1 100))
  (newline))
