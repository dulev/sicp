#lang sicp

(define (square a)
  (* a a))

(define (sum-squares a b)
  (+ (square a) (square b)))

(define (sum-squares-largest-two a b c)
  (cond ((and (<= a b) (<= a c)) (sum-squares b c))
        ((and (<= b a) (<= b c)) (sum-squares a c))
        (else (sum-squares a b))))

(sum-squares-largest-two 1 2 3)
(sum-squares-largest-two 3 2 1)
(sum-squares-largest-two 1 2 2)
(sum-squares-largest-two 1 1 2)
(sum-squares-largest-two 2 1 1)

