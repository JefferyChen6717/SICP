; include print.scm
; include fold-left-right.scm

(define (reverse-fold-right sequence)
  (fold-right (lambda (x y)
                (append y (list x)))
              '()
              sequence))

(define (reverse-fold-left sequence)
  (fold-left (lambda (x y)
               (cons y x))
             '()
             sequence))

(define lst (list 1 2 3 4))

; test
(print "reverse-fold-right")
(print(reverse-fold-right lst))
(print "reverse-fold-left")
(print(reverse-fold-left lst))
