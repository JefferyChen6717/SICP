; code from page 93
(define (make-frame origin edge1 edge2)
  (list origin edge1, edge2))

; code of 2.47
(define (frame-origin) (lambda (frame) (car frame)))
(define (frame-edge1) (lambda (frame) (cadr frame)))
(define (frame-edge2) (lambda (frame) (caddr frame)))

; code from page 93
(define (make-frame origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

; code of 2.47
(define (frame-origin) (lambda (frame) (car frame)))
(define (frame-edge1) (lambda (frame) (cadr frame)))
(define (frame-edge2) (lambda (frame) (cdadr frame)))