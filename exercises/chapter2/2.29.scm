(define (is-mobile? mobile)
  (and (pair? mobile)
       (is-branch? (left-branch mobile))
       (is-branch? (left-branch mobile))))

(define (make-mobile left right)
  (list left right))

(define (is-branch? branch)
  (and (pair? branch)
       (not (pair? (car branch)))))

(define (make-branch length structure)
  (list length structure))

; 2.29 a)
(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

; 2.29 b)
(define (total-weight x)
  (cond ((is-mobile? x)
           (+ (total-weight
                (branch-structure (left-branch x)))
              (total-weight
                (branch-structure (right-branch x)))))
        ((is-branch? x)
           (total-weight (branch-structure x))
           (branch-structure x))
        (else x)))

; 2.29 c)
(define (is-balance? x)
  (define (torque x)
    (* (branch-length x)
       (total-weight (branch-structure x))))
  (define (is-leaf-branch? x)
    (and (is-branch? x)
         (not (is-mobile? (branch-structure x)))))
  (if (and (not (is-mobile? x)) (not (is-branch? x)))
      #t
      (and (= (torque (left-branch x)) (torque (right-branch x)))
           (is-balance? (branch-structure (left-branch x)))
           (is-balance? (branch-structure (right-branch x))))))

; two mobiles for test
(define mobile-unbalance
  (make-mobile
    (make-branch 1 2)
    (make-branch
      3
      (make-mobile (make-branch 4 5)
                   (make-branch 6 7)))))

(define mobile-balance
  (make-mobile
    (make-branch 1 2)
    (make-branch
      1
      (make-mobile (make-branch 1 1)
                   (make-branch 1 1)))))

; 2.29 d)
; (cons a b) is (a b), (list a b) is (cons a (cons b nil))
; to get second part of a list is (cdr (car var))
; to get second part of a cons is (cdr var)
; if substitute 'list' with 'cons',
; just substitute all (cdr (car var)) with (cdr var)
