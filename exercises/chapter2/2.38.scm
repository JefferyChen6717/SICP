; include print.scm
; include accumulate.scm

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define (fold-right op initial sequence)
  (accumulate op initial sequence))

(print(fold-right / 1 (list 1 2 3)))
(print(fold-left / 1 (list 1 2 3)))

(print(fold-right list (list) (list 1 2 3)))
(print(fold-left list (list) (list 1 2 3)))

; the 'op' should satisfy multiple variables commutative
; like '+', '*', 'cons' satisfy 2 varibales commutative but
; couldn't satify more than 2 variables
