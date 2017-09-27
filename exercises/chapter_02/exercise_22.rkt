#lang sicp

;;; This reverses the list because the algorithm
;;; appends to the beginning of the answer list
;;; at each iteration.
(define (square-list items)
    (define (iter things answer)
        (if (null? things)
            answer
            (iter (cdr things)
                (cons (square (car things))
                      answer))))
    (iter items nil))

;;; This algorithm will not produce a list. It will
;;; produce a series of nested pairs similar to a list
;;; but the first element of the outermost pair will be
;;; the empty list and the last element of the innermost
;;; will be the first element of the initial items list.
(define (square-list-second items)
    (define (iter things answer)
        (if (null? things)
            answer
            (iter (cdr things)
                  (cons answer
                        (square (car things))))))
    (iter items nil))
