; include accumulate.scm

(define (horner-eval x coefficient-seq)
  (accumulate (lambda (this-coeff higher-terms)
                (+ (* higher-terms x) this-coeff))
              0
              coefficient-seq))
