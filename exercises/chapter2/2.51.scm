;include 2.50.scm
; code from page 95
(define (beside painter1 painter2)
  (let ((split-point (make-vect 0.5 0.0)))
    (let ((paint-left
           (transform-painter painter1
                              (make-vect 0.0 0.0)
                              split-point
                              (make-vect 0.0 1.0)))
          (paint-right
           (transform-painter painter2
                              split-point
                              (make-vect 0.5 0.0)
                              (make-vect 0.5 1.0))))
      (lambda (frame)
        (paint-left frame)
        (paint-right frame)))))

; code of 2.51
(define (below painter1 painter2)
  (let ((split-point (make-vect 0.0 0.5)))
    (let ((paint-up
           (transform-painter painter1
                              split-point
                              (make-vect 1.0 0.5)
                              (make-vect 0.0 1.0)))
          (paint-below
           (transform-painter painter2
                              (make-vect 0.0 0.0)
                              (make-vect 1.0 0.0)
                              split-point)))
      (lambda (frame)
        (paint-left frame)
        (paint-right frame)))))

(define (below painter1 painter2)
  (let ((split-point (make-vect 0.5 0.0)))
    (let ((paint-left
           (transform-painter painter1
                              (make-vect 0.0 0.0)
                              split-point
                              (make-vect 0.0 1.0)))
          (paint-right
           (transform-painter painter2
                              split-point
                              (make-vect 0.5 0.0)
                              (make-vect 0.5 1.0)))
          (rotate-up
            (lambda (p)
              (transform-painter p
                                 (make-vect 0.0 0.5)
                                 (make-vect 1.0 0.5)
                                 (make-vect 0.0 1.0))))
          (rotate-down
            (lambda (p)
              (transform-painter p
                                 (make-vect 0.0 0.0)
                                 (make-vect 1.0 0.0)
                                 (make-vect 0.0 0.5)))))
      (lambda (frame)
        ((rotate-up (paint-left frame)))
        ((rotate-down (paint-right frame)))))))