(define (op-identity op)
  (lambda (painter)
    (op painter painter)))

(define (split op1 op2)
  (lambda (painter n)
    (let ((smaller
      (if (= n 0)
          painter
          ((op-identity op2) (split op1 op2 painter (- n 1))))))
      (op1 painter smaller))))