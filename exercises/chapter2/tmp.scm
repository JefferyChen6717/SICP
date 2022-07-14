; include accumulate.scm
; include prime.scm
; include enumerate.scm

(define (op n)
  (map (lambda (i)
         (map (lambda (j) (list i j))
              (enumerate-interval 1 (- i 1))))
       (enumerate-interval 1 n)))
