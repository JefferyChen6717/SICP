; include enumerate.scm
; include accumulate.scm

(define (unique-pair n)
  (accumulate
    append
    '()
    (map (lambda (i)
           (map (lambda (j) (list i j))
                (enumerate-interval 1 (- i 1))))
         (enumerate-interval 1 n))))

(define (unique-triple-tuple n)
  (accumulate
    append
    '()
    (map (lambda (i)
           (map (lambda (j) (cons i j))
                (unique-pair (- i 1))))
         (enumerate-interval 1 n))))
