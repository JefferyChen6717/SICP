;;; it seems that this exercise could not word in chezscheme
; include map.scm

(define (subsets s)
  (if (null? s)
      (list)
      (let ((rest (subsets (cdr s))))
        (append rest (map-list
                       (lambda (x) (cons (car s) x))
                       rest)))))
