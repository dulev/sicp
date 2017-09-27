#lang sicp

(define (exp number exponent)
  (define (iter-exp a b n)
    (cond ((< n 1) a)
          ((even? n) (iter-exp a (* b b) (/ n 2)))
          (else (iter-exp (* a b) b (- n 1)))))
  (iter-exp 1 number exponent))

(define (even? n)
  (= (/ n 2) 0))

(exp 2 5)
(exp 3 3)
(exp 123 100)