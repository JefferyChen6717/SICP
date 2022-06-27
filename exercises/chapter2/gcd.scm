(define (gcd a b)
  (define (help a b)
    (let ((tmp (remainder a b)))
      (if (= tmp 0)
          b
          (help b tmp))))
  (if (< (abs a) (abs b))
      (help (abs b) (abs a))
      (help (abs a) (abs b))))
