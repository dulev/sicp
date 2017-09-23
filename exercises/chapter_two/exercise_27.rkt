#lang sicp

(define (reverse items)
    (define (iter items result)
        (if (null? items)
            result
            (iter (cdr items) (cons (car items) result))))
    (iter items nil))

(define (deep-reverse items)
    (if (pair? items)
        (reverse (map deep-reverse items))
        items))

;;; (deep-reverse (list (list 1 2) (list 3 4)))