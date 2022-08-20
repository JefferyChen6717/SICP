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
