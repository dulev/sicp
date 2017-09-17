#lang sicp

(define (average . args) (/ (apply + args) (length args)))

(define (make-segment a b) (cons a b))
(define (start-segment s) (car s))
(define (end-segment s) (cdr s))

(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))
(define (print-point p)
    (display "(")
    (display (x-point p))
    (display ",")
    (display (y-point p))
    (display ")")
    (newline))

(define (midpoint-segment s)
    (define start-point (start-segment s))
    (define end-point (end-segment s))
    (let ((average-x (average (x-point start-point) (x-point end-point)))
          (average-y (average (y-point start-point) (y-point end-point))))
        (make-point average-x average-y)))

;;; (define point-a (make-point 0 0))
;;; (define point-b (make-point 1 1))
;;; (define segment-ab (make-segment point-a point-b))
;;; (define midpoint-ab (midpoint-segment segment-ab))
;;; (print-point midpoint-ab)

(#%provide (all-defined))