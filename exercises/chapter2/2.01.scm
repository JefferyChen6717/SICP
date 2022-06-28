; include utils.scm

; define rational number
(define (make-rat n d)
(define (abs x) (if (< x 0) (- x) x))
  (define new-n
    (if (< (* n d) 0)
        (- (abs n))
	      (abs n)))
  (define new-d (abs d))
  (let ((div (abs (gcd new-n new-d))))
    (cons (/ new-n div) (/ new-d div))))

(define (numer x) (car x))
(define (denom x) (cdr x))

; define calculation
(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))
(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))
(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))
(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))
(define (equal-rat? x y)
  (=  (* (numer x) (denom y))
      (* (numer y) (denom x))))

(define (print-rat x)
  (begin
    (display (numer x))
    (display "/")
    (display (denom x))
    (newline)))

(define one-half (make-rat 2 4))
(define one-third (make-rat 3 9))

(print-rat (mul-rat one-half one-third))
