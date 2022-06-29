; include 2.07.scm
(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c p)
  (make-interval (- c (* c (/ p 100.0)))
                 (+ c (* c (/ p 100.0)))))

(define (percent i)
  (let ((ctr (center i)))
  (* (/ (- (upper-bound i) ctr) ctr) 100.0)))
