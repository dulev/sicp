#lang sicp

(define tolerance 0.001)
(define (fixed-point f first-guess)
    (define (close-enough? v1 v2)
        (< (abs (- v1 v2))
           tolerance))
    (define (try guess)
        (let ((next (f guess)))
            (if (close-enough? guess next)
                next
                (try next))))
    (try first-guess))

(define (average . args) (/ (apply + args) (length args)))
(define (average-damp f)
    (lambda (x) (average x (f x))))

(define (repeated f n)
    (define (compose f g) 
        (lambda (x) (f (g x))))
    (if (= n 1)
        f
        (compose f (repeated f (- n 1)))))

(define (n-th-root n x average-damp-times)
    (define (n-th-function y)
        (/ x (expt y (- n 1))))
    (fixed-point ((repeated average-damp average-damp-times) n-th-function) 1.0))

;;; Algorithm source:
;;; https://en.wikipedia.org/wiki/Cycle_detection
(define (floyds-algorithm f x0)
    (define (iter tortoise hare)
        (if (= tortoise hare)
            #t
            (iter (f tortoise) (f (f hare)))))
    (iter x0 (f x0)))

(n-th-root 2 9 1)
(n-th-root 3 9 1)
(n-th-root 4 9 1)
(n-th-root 5 9 2)
(n-th-root 6 9 1)
(n-th-root 7 9 1)
(n-th-root 8 9 1)
(n-th-root 9 9 1)
(n-th-root 10 9 1)
(n-th-root 11 9 1)
(n-th-root 12 9 1)
(n-th-root 13 9 3)
(n-th-root 14 9 3)
(n-th-root 15 9 2)