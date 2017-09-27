#lang sicp

(#%require "exercise_33.rkt")

(define (enumerate-tree tree)
    (cond ((null? tree) nil)
          ((not (pair? tree)) (list tree))
          (else (append (enumerate-tree (car tree))
                (append (enumerate-tree (cdr tree)))))))

(define (count-leaves t)
    (accumulate + 0 (map (lambda (x) 1) (enumerate-tree t))))

;;; (count-leaves (list (list 5 2) (list 3 1)))