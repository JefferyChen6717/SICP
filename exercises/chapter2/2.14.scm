; include 2.07.scm

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))

; suppose r1 is (2.9 3.1), r2 is (1, 3)
; there is a extinct difference between par1 and par2
