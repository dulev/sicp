#lang sicp

(define tolerance 0.0001)

(define (iterative-improve good-enough improve-guess)
    (define (iterate guess)
        (if (good-enough guess)
            guess
            (iterate (improve-guess guess))))
    (lambda (guess) (iterate guess)))

(define (average a b) (/ (+ a b) 2))

(define (sqrt x)
    (define (good-enough-sqrt-guess guess)
        (< (abs (- (* guess guess) x))
           tolerance))
    (define (improve-sqrt-guess guess)
        (average guess (/ x guess)))
    ((iterative-improve good-enough-sqrt-guess improve-sqrt-guess) x))

(define (fixed-point f first-guess)
    (define (good-enough guess)
        (< (abs (- guess (f guess)))
           tolerance))
    (define (improve-guess guess)
        (average guess (f guess)))
    ((iterative-improve good-enough improve-guess) first-guess))
    
(sqrt 4.0)
(fixed-point (lambda (y) (+ (sin y) (cos y))) 1.0)