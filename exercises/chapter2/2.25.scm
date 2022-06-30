(define (print-list op lst)
  (begin
    (display (op lst))
    (newline)))

; (define lst (1 3 (5 7) 9))
; (car (cdr (car (cdr (cdr lst)))))
; (cadaddr lst) = 7 (last letter before 'r' will be executed first)
(define lst (list 1 3 (list 5 7) 9))
(print-list cadaddr lst)

; (define lst ((7))
(define lst (list (list 7)))
(print-list caar lst)

; (define lst (1 (2 (3 (4 (5 (6 7)))))))
; (cadadadadadadr lst)
; (list a b) -> (cons a (cons b nil))
;   a = (car list), b = (car (cdr list))
(define lst
  (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
(print-list cadadadadadadr lst)