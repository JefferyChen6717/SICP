; the code from line 2 to line 19 is located in "SICP" p26
; (define (count-change amount)
  ; (cc amount 5))
;
; (define (cc amount kinds-of-coins)
  ; (cond ((= amount 0) 1)
        ; ((or (< amount 1) (= kinds-of-coins 0)) 0)
        ; (else (+ (cc amount
                     ; (- kinds-of-coins 1))
                 ; (cc (- amount
                        ; (first-denomination kinds-of-coins))
                     ; kinds-of-coins)))))
;
; (define (first-denomination kinds-of-coins)
  ; (cond ((= kinds-of-coins 1) 1)
        ; ((= kinds-of-coins 2) 5)
        ; ((= kinds-of-coins 3) 10)
        ; ((= kinds-of-coins 4) 25)
        ; ((= kinds-of-coins 5) 50)))
;
; code of 2.19
(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 0.5))

(define (cc amount coin-values)
  (define (no-more? x) (null?  x))
  (define (first-denomiation x) (car x))
  (define (except-first-denomination x) (cdr x))
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
          (+ (cc amount
                 (except-first-denomination coin-values))
             (cc (- amount
                    (first-denomiation coin-values))
                 coin-values)))))
