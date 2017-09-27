#lang sicp

(#%require "exercise_33.rkt")

(define (accumulate-n op init seqs)
    (if (null? (car seqs))
        nil
        (cons (accumulate op init (map car seqs))
              (accumulate-n op init (map cdr seqs)))))

;;; (accumulate-n + 0 (list (list 1 2) (list 3 4)))

(#%provide accumulate-n)