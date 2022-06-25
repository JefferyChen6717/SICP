(define (smooth f)
  (lambda(x)
    (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))

(define (repeated f n)
  (if (= n 1)
    f
    (lambda(x) (f ((repeated f (- n 1)) x)))))

(define (smooth-n f n)
  (repeated (smooth f) n))
