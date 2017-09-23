#lang sicp

(define (fringe tree)
    (cond ((not (pair? tree)) (list tree))
          ((null? (cdr tree)) (fringe (car tree)))
          (else (append (fringe (car tree)) 
                        (fringe (cdr tree))))))

(define x (list (list 1 2) (list 3 4)))

;;; (display (fringe x))
;;; (display (fringe (list x x)))