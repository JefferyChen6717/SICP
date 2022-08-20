; include flatmap.scm

(define (adjoin-position new-row k rest-of-queens)
  (if (= k 1)
      (list new-row)
      (cons new-row rest-of-queens)))
