(define (no-row-conflict? positions)
  (define (check new-add rest)
    (if (null? rest)
        #t
        (if (= new-add (car rest))
            #f
            (check new-add (cdr rest)))))
  (if (null? positions)
      #t
      (check (car positions) (cdr positions))))


(define (no-incline-conflict? positions)
  (define (check new-add offset rest)
    (cond ((null? rest) #t)
          ((or (= (car rest) (- new-add offset)) (= (car rest) (+ new-add offset))) #f)
          (else (check new-add (+ offset 1) (cdr rest)))))
  (if (null? positions)
      #t
      (check (car positions) 1 (cdr positions))))

(define (safe? k positions)
  (and (no-row-conflict? positions)
       (no-incline-conflict? positions)))
