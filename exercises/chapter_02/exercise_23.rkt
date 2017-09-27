#lang sicp

(define (for-each proc items)
    (cond ((not (null? items))
           (proc (car items))
           (for-each proc (cdr items)))))

(for-each (lambda (x) (display x) (newline)) (list 1 2 3))
