#lang sicp

(define (repeated f n)
    (define (compose f g) 
        (lambda (x) (f (g x))))
    (if (= n 1)
        f
        (compose f (repeated f (- n 1)))))

(define (square x) (* x x))

((repeated square 2) 4)
((repeated square 2) 5)