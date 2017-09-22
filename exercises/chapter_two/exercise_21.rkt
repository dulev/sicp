#lang sicp

(define (square-list items)
    (if (null? items)
    nil
    (cons (expt (car items) 2) (square-list (cdr items)))))

(define (square-list-improved items)
    (map (lambda (x) (* x x)) items))