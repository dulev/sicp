#lang sicp

(define (repeated f n)
    (define (compose f g) 
        (lambda (x) (f (g x))))
    (if (= n 1)
        f
        (compose f (repeated f (- n 1)))))

(define (smooth f dx)
    (lambda (x) (/ (+ (f (- x dx))
                      (f x)
                      (f (+ x dx)))
                   3)))

(define (n-fold-smooth n f dx)
    (define (precise-smooth f)
        (smooth f dx))
    (repeated precise-smooth n))

;;; Smoothing tests using dx=1:

(define (test x)
    (cond ((= x 0) 1)
          ((= x 1) 2)
          ((= x 2) 2)
          ((= x 3) 1)
          ((= x 4) 2)
          (else 0)))
          
((n-fold-smooth 1 test 1) -1)
((n-fold-smooth 1 test 1) 0)
((n-fold-smooth 1 test 1) 1)
((n-fold-smooth 1 test 1) 2)
((n-fold-smooth 1 test 1) 3)
((n-fold-smooth 1 test 1) 4)
((n-fold-smooth 1 test 1) 5)
((n-fold-smooth 1 test 1) 6)

;;; ((smooth test) -1)
;;; ((smooth test) 0)
;;; ((smooth test) 1)
;;; ((smooth test) 2)
;;; ((smooth test) 3)
;;; ((smooth test) 4)
;;; ((smooth test) 5)
;;; ((smooth test) 6)