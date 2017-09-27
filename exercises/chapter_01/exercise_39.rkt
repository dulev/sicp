#lang sicp

(define (cont-frac n d k)
    (define (cont-frac-rec x)
        (if (> x k)
            (/ (n x) (d x))
            (/ (n x) (+ (d x) (cont-frac-rec (+ x 1))))))
    (cont-frac-rec 1))

(define (tan-cf x k)
    (define (n-terms i)
        (if (= i 1)
            x
            (- (* x x))))
    (define (d-terms i)
        (let ((new-i (- i 1)))
            (+ 1 (* 2.0 new-i))))
    (cont-frac n-terms d-terms k))

(tan-cf 10 15)
(tan-cf 2 15)
(tan-cf 3.14 15)