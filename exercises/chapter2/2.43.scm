; in 2.42's solution, it first generates (queen-cols (- k 1)) then adds
; every possible new-row to every board in (queen-cols (- k 1))
; in every recursion it call (queen-cols (- k 1)) once

; but in 2.43's solution, for every possible new-row it generates
; (queen-cols (- k 1)) once and totally board-size times

; so if 2.42 costs T, 2.43 costs board-size * board-size * T
