(define (for-each op lst)
  (if (null? lst)
      #t
      (begin
       (op (car lst))
       (for-each op (cdr lst)))))
