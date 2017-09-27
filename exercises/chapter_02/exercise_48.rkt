#lang sicp

(#%require "exercise_46.rkt")

(define (make-segment v1 v2) (list v1 v2))
(define (start-segment s) (car s))
(define (end-segment s) (cadr s))

(#%provide (all-defined))