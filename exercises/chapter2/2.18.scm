(define (reverse lst)
  (if (null? (cdr lst))
      (list (car lst))
      (append (reverse (cdr lst)) (list (car lst)))))
