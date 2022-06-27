; include utils.scm
(define (same-parity x . y)
  (define (help lst x y)
    (if (null? y)
        lst
        (help (if (= (remainder x 2)
                     (remainder (car y) 2))
                  (list-add lst (car y))
                  lst)
              x
              (cdr y))))
  (define lst
    (help (list x) x y))
  (cdr lst))
