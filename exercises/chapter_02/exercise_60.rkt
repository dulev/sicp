#lang sicp

;;; No need to modify this function.
(define (element-of-set? x set)
    (cond ((null? set) false)
          ((equal? x (car set)) true)
          (else (element-of-set? x (cdr set)))))

;;; We need to modify adjoin-set to always include the new element.
(define (adjoin-set x set) (cons x set))

;;; We need to be able to remove elements in order to do the intersection.
(define (remove-one-entry x set)
    (cond ((null? set) set)
          ((equal? x (car set)) (cdr set))
          (else (cons (car set) (remove-one-entry x (cdr set))))))
(define (intersection-set set1 set2)
    (cond ((or (null? set1) (null? set2)) '())
          ((element-of-set? (car set1) set2)
           (cons (car set1) 
                 (intersection-set (cdr set1) (remove-one-entry (car set2) set2))))
          (else (intersection-set (cdr set1) set2))))

;;; We need to use the operation difference of sets for the union.
(define (difference set1 set2)
    (if (null? set2)
        set1
        (difference (remove-one-entry (car set2) set1) (cdr set2))))
;;; We use the inclusion-exclusion principle for the union.
(define (union-set set1 set2)
    (difference (append set1 set2) (intersection-set set1 set2)))