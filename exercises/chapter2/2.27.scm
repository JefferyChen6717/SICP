(define (deep-reverse x)
  (cond ((or (not (pair? x)) (null? x)) x)
        ((null? (cdr x)) (list (deep-reverse (car x))))
        (else (append (deep-reverse (cdr x))
                      (list (deep-reverse (car x)))))))