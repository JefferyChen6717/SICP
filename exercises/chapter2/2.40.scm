; include accumulate.scm
; include enumerate.scm
; include filter.scm
; include prime.scm

; code at page 83

; generate all eligible pair
; (accumulate append
;             '()
;             (map (lambda (i)
;                    (map (lambda (j) (list i j))
;                         (enumerate-interval 1 (- i 1))))
;                  (enumerate-interval 1 n)))

; merge map and accumulate in one process
(define (flatmap proc seq)
  (filter (lambda (x) (not (null? x)))
    (accumulate append '(()) (map proc seq))))

; get the sum of the pair and determine whether the sum is a prime
(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

; for pair (a b) generate (a b a+b)
(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

; merge all funcs above
(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (flatmap
                 (lambda (i)
                   (map (lambda (j) (list i j))
                     (enumerate-interval 1 (- i 1))))
                 (enumerate-interval 1 n)))))

; code at page 84
(define (permutations s)
  (if (null? s)
      (list '())
      (flatmap (lambda (x)
                 (map (lambda (p) (cons x p))
                      (permutations (remove x s))))
               s)))
(define (remove item seq)
  (filter (lambda (x) (not (= x item)))
          seq))

; 2.40
(define (unique-pairs n)
  (define (flatmap proc seq)
    (filter (lambda (x) (not (null? x)))
      (accumulate append '(()) (map proc seq))))
  (flatmap
    (lambda (i)
      (map (lambda (j) (list i j))
        (enumerate-interval 1 (- i 1))))
    (enumerate-interval 1 n)))
