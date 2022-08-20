; include flatmap.scm
; include filter.scm
; include enumerate.scm

; include 2.42_safe.scm
; include 2.42_adjoin_position.scm

(define empty-board '())

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
          (lambda (positions) (safe? k positions))
          (flatmap
            (lambda (rest-of-queens)
              (map (lambda (new-row)
                     (adjoin-position new-row k rest-of-queens))
                   (enumerate-interval 1 board-size)))
            (queen-cols (- k 1))))))
  (queen-cols board-size))

(display (queens 5))
