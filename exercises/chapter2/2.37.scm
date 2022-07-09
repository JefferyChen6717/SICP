; include accumulate.scm

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product x v)) m))

(define (transpose mat)
  (accumulate-n cons (list) mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (x) (matrix-*-vector cols x)) m)))

; define some data
(define vet1 (list 1 2 3))
(define vet2 (list 4 5 6))
(define mat1 (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))
(define mat2 (list (list 10 11 12) (list 13 14 15) (list 16 17 18)))
