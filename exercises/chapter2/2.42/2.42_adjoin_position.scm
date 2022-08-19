; include flatmap

(define adjoin-position new-row k rest-of-queens
  (if (= k 0)
      (list new-row)
      (map
        (lambda one-list (cons new-row one-list))
        rest-of-queens)))
  