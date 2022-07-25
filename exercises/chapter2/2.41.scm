; include enumerate.scm
; include accumulate.scm

(define (generate-triple-tuple n)
  (accumulate append
             '()
              (map (lambda (i)
                     (map (lambda (j)
                            (cons i j))
                          (map (lambda (k) (list j k))
                               (enumerate-interval 1 (- j 1)))))
                   (
                   (enumerate-interval 1 n))))
