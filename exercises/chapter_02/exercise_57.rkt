#lang sicp

(define (make-sum . args)
    (if (null? (cdr args))
        (car args)
        (list '+ (car args) (apply make-sum (cdr args)))))
(define (make-product . args)
    (if (null? (cdr args))
        (car args)
        (list '* (car args) (apply make-product (cdr args)))))

;;; (display (make-sum 1 2 3 4 5))
;;; (display (make-product 10 20 30 40))
