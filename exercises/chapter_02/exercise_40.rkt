#lang sicp

(#%require "../chapter_one/exercise_33.rkt")

(define (accumulate op init seq)
    (if (null? seq)
        init
        (op (car seq)
            (accumulate op init (cdr seq)))))
(define (filter predicate seq)
    (cond ((null? seq) nil)
          ((predicate (car seq))
           (cons (car seq)
                 (filter predicate (cdr seq))))
          (else (filter predicate (cdr seq)))))

(define (flatmap proc seq)
    (accumulate append nil (map proc seq)))
(define (enumerate-interval low high)
    (if (> low high)
        nil
        (cons low (enumerate-interval (+ low 1) high))))

(define (unique-pairs n)
    (flatmap (lambda (i)
                (map (lambda (j) (cons i j))
                     (enumerate-interval 1 (- i 1))))
             (enumerate-interval 1 n)))

(define (make-pair-sum p)
    (list (car p) (cdr p) (+ (car p) (cdr p))))
(define (sum-pairs-prime? p)
    (prime? (+ (car p) (cdr p))))

(define (prime-sum-pairs n)
    (map make-pair-sum (filter sum-pairs-prime? (unique-pairs n))))

;;; (display (prime-sum-pairs 5))

(#%provide (all-defined))