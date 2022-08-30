; code from textbook page 89-90
(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left (beside up up))
              (bottom-right (below right right))
              (corner (corner-split painter (- n 1))))
          (beside (below painter top-left)
                  (below bottom-right corner))))))

; beginning of the ansewr
(define (beside-identity i)
  (beside i i))

(define (up-split painter n)
  (let ((top (if (= n 0)
                 painter
                 (beside-identity (up-split painter (- n 1))))))
    (below painter top)))