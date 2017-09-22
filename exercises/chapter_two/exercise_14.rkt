#lang sicp

(#%require "exercise_07.rkt" "exercise_12.rkt" "exercise_13.rkt")

(define A (make-center-percent 10 10))
(define B (make-center-percent 5 10))
(define divAA (div-interval A A))
(define divAB (div-interval A B))
(define mulAA (mul-interval A A))
(define mulAB (mul-interval A B))

;;; We can see that division and multiplication of 
;;; intervals displaces the center to the right.
(center divAA)
(center divAB)
(newline)
(center mulAA)
(center mulAB)
(newline)
(par1 A B)
(par2 A B)

(div-interval (make-interval 1 1) (make-interval 1 1))