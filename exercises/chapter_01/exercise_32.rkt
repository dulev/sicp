#lang sicp

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate combiner null-value term (next a) next b))))

(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value))

(define (add a b) (+ a b))
(define (multiply a b) (* a b))
(define (id x) x)
(define (inc x) (+ x 1))
(define (sum term a next b) (accumulate add 0 term a next b))
(define (product term a next b) (accumulate multiply 1 term a next b))

(sum id 1 inc 6)
(product id 1 inc 5)