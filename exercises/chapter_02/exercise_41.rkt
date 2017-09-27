#lang sicp

(#%require "exercise_40.rkt")

(define (unique-triplets n)
    (flatmap (lambda (p)
                (map (lambda (k) (list k (cdr p) (car p)))
                     (enumerate-interval 1 (- (min (car p) (cdr p)) 1))))
             (unique-pairs n)))
(define (unique-triplets-alt n)
    (flatmap (lambda (i)
                 (flatmap (lambda (j) 
                              (map (lambda (k) (list k j i))
                                   (enumerate-interval 1 (- j 1))))
                          (enumerate-interval 1 (- i 1))))
             (enumerate-interval 1 n)))

(define (triplets-specified-sum n s)
    (filter (lambda (t) 
                (= s (+ (car t) (cadr t) (caddr t))))
            (unique-triplets n)))

;;; (display (unique-triplets 5))
;;; (display (unique-triplets-alt 5))
;;; (display (triplets-specified-sum 6 9))
;;; (display (triplets-specified-sum 10 20))
