; (variable? e)
; (same-variable? v1 v2)
; (sum? e) whether e is a sum expression
; (addend e)
; (augend e)
; (make-sum a1 a2)
; (product? e) whether e is a product expression
; (multiplier e)
; (multiplicand e)
; (make-product m1 m2)

(define (variable? x) (symbol? x))
(define (same-variable? v1 v2) (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (make-sum a1 a2) (list '+ a1 a2))
(define (make-product m1 m2) (list '* m1 m2))

(define (sum? x) (and (pair? x) (eq? (car x) '+)))
(define (product? x) and (pair? x) (eq? (car x) '*))

(define (addend x) (cadr x))
(define (augend x) (caddr x))

(define (multiplier x) (cadr x))
(define (multiplicand x) (caddr x))

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
          (if (same-variable? exp var) 1 0))
        ((sum? exp)
          (make-sum (deriv (addend exp) var) (deriv (augend exp) var)))
        ((product? exp)
          (make-sum
            (make-product (multiplier exp)
                          (deriv (multiplicand exp) var))
            (make-product (multiplicand exp)
                          (deriv (multiplier exp) var))))
        (else (display "unknown type"))))