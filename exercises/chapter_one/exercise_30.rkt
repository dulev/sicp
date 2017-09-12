#lang sicp


(define (inc x) (+ x 1))
(define (id x) x)

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
  (iter a 0))


(sum id 1 inc 3)