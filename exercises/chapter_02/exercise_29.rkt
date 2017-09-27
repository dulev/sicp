#lang sicp

(define (make-mobile left right) 
    (list left right))
(define (make-branch length structure)
    (list length structure))

;;; If we used cons instead of list, we would only need to change
;;; right-branch and branch-structure because we have provided
;;; a good abstraction layer on which to build the rest of the
;;; functionality.

(define (left-branch mobile)
    (car mobile))
(define (right-branch mobile)
    (car (cdr mobile)))
(define (branch-length branch)
    (car branch))
(define (branch-structure branch)
    (car (cdr branch)))

(define (total-weight node)
    (if (not (pair? node))
        node
        (+ (total-weight (branch-structure (left-branch node)))
           (total-weight (branch-structure (right-branch node))))))

(define (branch-torque branch)
    (* (branch-length branch) (total-weight (branch-structure branch))))

(define (balanced? node)
    (if (not (pair? node))
        true
        (and (= (branch-torque (left-branch node)) (branch-torque (right-branch node)))
             (balanced? (branch-structure (left-branch node)))
             (balanced? (branch-structure (right-branch node))))))

;;; (define x (make-mobile (make-branch 1 (make-mobile (make-branch 1 2) 
;;;                                                    (make-branch 1 1))) 
;;;                        (make-branch 1 5)))
;;; (define y (make-mobile (make-branch 1 1) (make-branch 1 1)))
;;; (balanced? x)
;;; (balanced? y)
