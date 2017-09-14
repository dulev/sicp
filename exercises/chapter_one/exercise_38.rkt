#lang sicp

(define (cont-frac n d k)
    (define (cont-frac-rec x)
        (if (> x k)
            (/ (n x) (d x))
            (/ (n x) (+ (d x) (cont-frac-rec (+ x 1))))))
    (cont-frac-rec 1))

(define (d x)
    (if (= (remainder x 3) 2)
        (* 2 (+ 1 (floor (/ x 3))))
        1))

(+ 2 (cont-frac (lambda (x) 1.0)
                d
                8))