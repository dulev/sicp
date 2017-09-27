#lang sicp

(define (product term a next b)
  (if (> a b)
      1
      (* (term a) (product term (next a) next b))))

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
    (iter a 1))

(define (identity x) x)
(define (increment x) (+ x 1))

(define (factorial n) (product identity 1 increment n))
(factorial 5)

(define (pi-term n)
  (define (square x) (* x x)) 
  (/ (* (* n 2.0) (+ 2 (* n 2)))
     (square (+ (* n 2) 1))))

(define (approximate-pi n)
  (* 4 (product pi-term 1 increment n)))

(approximate-pi 100000)