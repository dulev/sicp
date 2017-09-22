#lang sicp

(define (equal-mod-2 a b) (= (remainder a 2) (remainder b 2)))
(define (reverse l)
    (define (reverse-iter result l)
        (if (null? l)
            result
            (reverse-iter (cons (car l) result) (cdr l))))
    (reverse-iter nil l))

(define (same-parity . integers)
    (define (same-parity-iter first-integer result integers)
        (cond ((null? integers) result)
              ((equal-mod-2 (car integers) first-integer) 
               (same-parity-iter first-integer (cons (car integers) result) (cdr integers)))
              (else (same-parity-iter first-integer result (cdr integers)))))
    (reverse (same-parity-iter (car integers) nil integers)))

;;; (same-parity 1 2 3 4 5 6)