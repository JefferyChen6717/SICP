(define (normalize a b)
  (if (> (* a b) 0)
      (

(define (make-rat n d)
  (let ((divisor (
    (cons
      (/ n divisor)
      (/ d divisor))))
(define (numer x) (car x))
(define (denom x) (cdr x))

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (print-rat x)
  (display (numer x)) (display "/") (display (denom x))
  (newline))

(define (gcd x y)
  (define (help x y)
    (let ((tmp (remainder x y)))
      (if (= tmp 0)
          y
          (help y tmp))))
  (if (> x y)
      (help x y)
      (help y x)))

(define one-half (make-rat 3 6))
(define one-third (make-rat 3 9))

(print-rat (add-rat one-half one-third))
