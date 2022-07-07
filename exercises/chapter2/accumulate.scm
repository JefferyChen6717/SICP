(define (accumulate bi-func initial sequence)
  (if (null? sequence)
      initial
      (bi-func (car sequence)
          (accumulate bi-func initial (cdr sequence)))))
