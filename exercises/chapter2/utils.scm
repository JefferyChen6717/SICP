(define (abs x) (< x 0) (- x) x)

(define (exp n x)
  (define (help n x product)
    (cond ((= x 0) product)
          ((< x 0) (help n (+ x 1) (/ product n)))
          ((> x 0) (help n (- x 1) (* product n)))))
  (help n x 1))

(define (square x) (* x x))

(define (gcd a b)
  (define (help a b)
    (let ((tmp (remainder a b)))
      (if (= tmp 0)
	    b
	    (help b tmp))))
  (if (> b a)
      (help (abs b) (abs a))
      (help (abs b) (abs a))))

; funcs of list
(define (list-has-next x) (not (null? (cdr x))))

(define (list-add lst x) (append lst (list x)))

; map func of list
(define (map operation lst)
  (if (null? lst)
      lst
      (cons (operation (car lst))
            (map operation (cdr lst)))))
