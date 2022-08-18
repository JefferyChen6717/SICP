(define (get-last lst)
  (cond ((null? lst) '())
        ((null? (cdr lst)) (car lst))
        (else (get-last (cdr lst)))))

(define (no-row-conflict? positions)
    (let ((last-number (get-last positions)))
      (cond ((null? positions) #t)
            ((null? (cdr positions)) #t)
            (else (and (not (= (car positions) last-number))
                       (no-row-conflict? (cdr positions)))))))

(define (no-incline-conflict? k positions)
  (define last-number (get-last positions))
  (define (iter i k positions)
    (if (or (= i k) (> i k))
        #t
        (let ((conflict1 (+ (car positions) (- k i)))
              (conflict2 (- (car positions) (- k i))))
          (and (iter (+ i 1) k (cdr positions))
               (and (not (= last-number conflict1))
                    (not (= last-number conflict2)))))))
  (iter 1 k positions))


(define (safe? k positions)
  (and (no-row-conflict? positions)
       (no-incline-conflict? k positions)))
