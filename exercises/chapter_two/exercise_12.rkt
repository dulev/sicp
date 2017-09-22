#lang sicp

(#%require "exercise_07.rkt")

(define (make-center-width c w)
    (make-interval (- c w) (+ c w)))
(define (center i)
    (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
    (/ (- (lower-bound i) (upper-bound i)) 2))

(define (make-center-percent c p)
    (make-center-width c (* c (/ p 100.0))))
(define (percent i)
    (abs (* 100 (/ (width i) (center i)))))

;;; (percent (make-center-percent 10 5))

(#%provide (all-defined))
