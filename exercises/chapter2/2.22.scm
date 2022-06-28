; code showed exercise 2.22
; code 1
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items (list)))
;code 2
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items (list)))

; for code 1, it adds every squared element at the head of the answer
; list, which results in a reversed answer
; for code 2, (cons number list) is right way to connect a number and
; a list, but code 2 use (cons list number) which results in a mistake
; the more detailed explanation is on the page 66

; the right code is using 'append' which can connect two list
; but (square (car things)) is a number not a list and could be
; transformed into (list (square (car things)))
; here is right code:
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (list(square (car things)))))))
  (iter items (list)))
