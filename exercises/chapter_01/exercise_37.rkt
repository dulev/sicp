#lang sicp

(define (cont-frac n d k)
    (define (cont-frac-rec x)
        (if (> x k)
            (/ (n x) (d x))
            (/ (n x) (+ (d x) (cont-frac-rec (+ x 1))))))
    (cont-frac-rec 1))

(define (cont-frac-iterative n d k)
    (define (iter result x)
        (if (= x 0)
            result
            (iter (/ (n x) (+ (d x) result)) (- x 1))))
    (iter (/ (n k) (d k)) k))

(/ 1
   (cont-frac-iterative (lambda (i) 1.0)
                        (lambda (i) 1.0)
                        12))

(/ 1
   (cont-frac (lambda (i) 1.0)
              (lambda (i) 1.0)
              12))

