#lang sicp

(define (subsets s)
    (define (union-element x)
        (append (list (car s)) x))
    (if (null? s)
        (list nil)
        (let ((rest (subsets (cdr s))))
            (append rest (map union-element rest)))))

;;; We can partition all the subsets of a set this way:
;;; S1 + S2 + S3 + ... = B1 + B2 + B3 + ... + (a U B1) + (a U B2) + (a U B3) + ...
  
;;; (display (subsets (list 1 2 3)))