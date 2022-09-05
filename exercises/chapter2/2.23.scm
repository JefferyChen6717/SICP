(define (for-each op lst)
  (if (null? lst)
      '()
      (cons
       (op (car lst))
       (for-each op (cdr lst)))))
