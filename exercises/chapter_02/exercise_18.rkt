#lang sicp

(define (reverse l)
    (define (reverse-iter l result)
        (if (null? l)
            result
            (reverse-iter (cdr l) (cons (car l) result))))
    (reverse-iter l nil))

(reverse (list 1 2 3))