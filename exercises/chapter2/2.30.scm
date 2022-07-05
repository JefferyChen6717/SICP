; include square.scm
; include map.scm

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
