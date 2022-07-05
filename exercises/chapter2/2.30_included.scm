; include from: square.scm
;-------------------------------
(define square (lambda (x) (* x x)))
;-------------------------------
; end of include: square.scm

; include from: map.scm
;-------------------------------
; map func of list
(define (map-list operation lst)
  (if (null? lst)
      lst
      (cons (operation (car lst))
            (map-list operation (cdr lst)))))

; map func of tree
(define (map-tree operation tree)
  (cond ((null? tree) tree)
        ((not (pair? tree)) (operation tree))
        (else (cons (map-tree operation (car tree))
                    (map-tree operation (cdr tree))))))


;-------------------------------
; end of include: map.scm


(define (square-tree-a tree)
  (cond ((null? tree) tree)
        ((not (pair? tree)) (square tree))
        (else
          (cons (square-tree-a (car tree))
                (square-tree-a (cdr tree))))))

(define (square-tree-b tree)
  (map-list (lambda (sub-tree)
              (if (pair? sub-tree)
                  (square-tree-b sub-tree)
                  (square sub-tree)))
            tree))
