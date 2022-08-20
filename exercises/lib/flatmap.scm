; include accumulate.scm

(define (flatmap bi-func seq)
  (accumulate append '() (map bi-func seq)))
