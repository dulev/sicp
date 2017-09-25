#lang sicp

;;; The "op" procedure should have the commutative and associative
;;; properties if our goal is to have fold-left and fold-right produce
;;; identical results.

(define (fold-left op initial sequence)
    (define (iter result rest)
        (if (null? rest)
            result
            (iter (op result (car rest))
                  (cdr rest))))
    (iter initial sequence))

(define (fold-right op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (fold-right op initial (cdr sequence)))))

;;; (fold-right / 1 (list 1 2 3))
;;; (fold-left / 1 (list 1 2 3))
;;; (display (fold-right list nil (list 1 2 3)))
;;; (newline)
;;; (display (fold-left list nil (list 1 2 3)))

(#%provide (all-defined))