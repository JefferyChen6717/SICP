; code from page 93
(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
      (lambda (segment)
        (draw-line
          ((frame-coord-map frame) (start-segment segment))
          ((frame-coord-map frame) (start-segment segment))))
      segment-list)))

;code of 2.48
(define (make-segment v1 v2) (cons v1 v2))
(define (start-segment segment) (cdr segment))
(define (end-segment segment) (car segment))