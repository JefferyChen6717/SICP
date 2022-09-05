(define (for-each operation lst)
  (if (null? lst)
      '()
      (cons (operation (car lst)) (for-each operation (cdr lst)))))
