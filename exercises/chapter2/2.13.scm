; define p => percent value of error.
;   and p is the actual value not the value multiplied by 100
; suppose here are two intervals: (c1, p1), (c2, p2)
; product of these two intervals:
;   product = (c1 +/- c1 * p1) * (c2 +/- c2 * p2)
;     = c1 * c2 +/- p1 * c1 * c2 +/- p2 * c1 * c2
;       +/- p1 * p2 * c1 * c2
; because p1 and p2 are very small, so that the term p1 * p2 * c1 * c2
;   is also very small compared to the other 3 terms, so this term can
;   be ignored
; then product can be redued to:
;   product = (c1 * c2) * (1 +/- p1 +/- p2)
; the question 2.12 assumed that all numbers are positive, so the percent
;   of product is (1 - p1 - p2, 1 + p1 + p2)
; so we can quickly calculate the product interval:
;   ((c1 * c2) * (1 - p1 - p2 ),
;    (c1 * c2) * (1 + p1 + p2))
