(define (equal? a b)
  (cond ((and (null? a) (null? b)) #t)
        ((and (not (pair? a)) (not (pair? b)) (eq? a b)) #t)
        ((and (pair? a)
              (pair? b))
              (equal? (cdr a) (cdr b)) 
              (equal? (car a) (car b)))
        (else #f)))
