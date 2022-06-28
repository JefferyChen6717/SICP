; include utils.scm

(define (square-list items)
  (if (null? items)
      items
      (cons (square (car items))
            (square-list (cdr items)))))

(define (square-list-map items)
  (map square items))
