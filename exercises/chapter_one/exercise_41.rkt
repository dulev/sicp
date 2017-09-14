#lang sicp

(define (inc x) (+ x 1))

(define (double f)
    (lambda (x) (f (f x))))

((double inc) 2)
((double (lambda (x) (* x x))) 2)

(((double (double double)) inc) 5) ;; Should return 21