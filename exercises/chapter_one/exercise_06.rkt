#lang sicp

;; There would be a problem if the "if" construct
;; was defined as an ordinary procedure because
;; in that case the else-clause and then-clause
;; would always be evaluated before the "if" procedure
;; was called, as they are operands. That would cause
;; endless recursion.
;; This is the case only if the interpreter uses
;; applicative-order evaluation.

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.00001))

(define (abs x)
  (if (< x 0) (- x) x))

(define (improve guess x)
  (average guess (/ x guess)))

(define (square x)
  (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 9)