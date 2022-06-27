(define (abs x) (< x 0) (- x) x)

(define (exp n x)
  (define (help n x product)
    (cond ((= x 0) product)
          ((< x 0) (help n (+ x 1) (/ product n)))
          ((> x 0) (help n (- x 1) (* product n)))))
  (help n x 1))

(define (gcd a b)
  (define (help a b)
    (let ((tmp (remainder a b)))
      (if (= tmp 0)
	    b
	    (help b tmp))))
  (if (> b a)
      (help b a)
      (help a b)))
