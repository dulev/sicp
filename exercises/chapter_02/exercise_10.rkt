#lang sicp

(#%require "exercise_07.rkt")

(define (div-interval-fix x y)
    (if (and (<= (lower-bound y) 0) (>= (upper-bound y) 0))
        (error "Division of interval with 0 bound not defined.")
        (mul-interval x y)))