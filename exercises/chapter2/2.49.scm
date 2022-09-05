; include for-each.scm
; include 2.48.scm
; include 2.46.scm

; 2.49.1
(segments->painter
  (list (make-segment (make-vect 0 0) (make-vect 0 1))
        (make-segment (make-vect 0 1) (make-vect 1 1))
        (make-segment (make-vect 1 1) (make-vect 1 0))
        (make-segment (make-vect 1 0) (make-vect 0 0))))

; 2.49.2
(segments->painter
  (list (make-segment (make-vect 0 0) (make-vect 1 1))
        (make-segment (make-vect 0 1) (make-vect 1 0))))


; 2.49.3
(segments->painter
  (list (make-segment (make-vect 0 1) (make-vect 1 2))
        (make-segment (make-vect 1 2) (make-vect 2 1))
        (make-segment (make-vect 2 1) (make-vect 1 0))
        (make-segment (make-vect 1 0) (make-vect 0 1))))