#lang sicp

(define tolerance 0.0001)

(define (fixed-point f first-guess)
    (define (close-enough? v1 v2)
        (< (abs (- v1 v2))
           tolerance))
    (define (try-guess guess)
        (display guess)
        (display " -> ")
        (display (expt guess guess))
        (newline)
        (let ((next (f guess)))
            (if (close-enough? guess next)
                next
                (try-guess next))))
    (try-guess first-guess))

(define (f x) (/ (log 1000) (log x)))
(define (g x) (* 0.5 (+ x (/ (log 1000) (log x)))))

(fixed-point f 3)
(newline)
(fixed-point g 3)