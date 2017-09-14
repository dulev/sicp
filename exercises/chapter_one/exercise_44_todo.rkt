#lang sicp

(define (repeated f n)
    (define (compose f g) 
        (lambda (x) (f (g x))))
    (if (= n 1)
        f
        (compose f (repeated f (- n 1)))))

(define dx 0.1)
(define (smooth f)
    (lambda (x) (/ (+ (f (- x dx))
                      (f x)
                      (f (+ x dx)))
                   3)))

(define (n-fold-smooth n f)
    ((repeated smooth n) f))