; include accumulate.asm

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
    (list)
    (cons (accumulate op init
          (accumulate-n op init
