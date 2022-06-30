; (define x (list 1 2 3))
; (define y (list 4 5 6))
; (append x y) => (1 2 3 4 5 6)
; (cons x y) => ((1 2 3) 4 5 6)
; use cons to connect a variable and a list means add the variable
; to the head of the list and produce a list
; (list x y) => ((1 2 3) (4 5 6))

(define x (list 1 2 3))
(define y (list 4 5 6))
(begin
  (display (append x y))
  (newline)
  (display (cons x y))
  (newline)
  (display (list x y))
  (newline))
