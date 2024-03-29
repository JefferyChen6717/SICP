(list 'a 'b 'c)
(a b c)

(list (list 'george))
((george))

; '(...) is a list, '(a b) = (cons a (cons b '()))
(cdr '((x1 x2) (y1 y2)))
((y1 y2))

(cadr '((x1 x2) (y1 y2)))
(y1 y2)

(pair? (car '(a short list)))
#f

(memq 'red '((red shoes) (blue socks)))
#f

(memq 'red '(red shoes blue socks))
(red shoes blue socks)