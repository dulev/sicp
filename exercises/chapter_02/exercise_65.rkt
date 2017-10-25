#lang sicp

(#%require "exercise_63.rkt")

(define (list->tree elements)
    (car (partial-tree elements (length elements))))
(define (partial-tree elts n)
    (if (= n 0)
        (cons '() elts)
        (let ((left-size (quotient (- n 1) 2)))
            (let ((left-result
                    (partial-tree elts left-size)))
                (let ((left-tree (car left-result))
                      (non-left-elts (cdr left-result))
                      (right-size (- n (+ left-size 1))))
                    (let ((this-entry (car non-left-elts))
                          (right-result
                            (partial-tree
                                (cdr non-left-elts)
                                right-size)))
                        (let ((right-tree (car right-result))
                              (remaining-elts
                                (cdr right-result)))
    (cons (make-tree this-entry
                     left-tree
                     right-tree)
          remaining-elts))))))))

(define (adjoin-set x set)
    (cond ((null? set) (make-tree x '() '()))
          ((= x (entry set)) set)
          ((< x (entry set))
           (make-tree (entry set)
                      (adjoin-set x (left-branch set))
                      (right-branch set)))
          ((> x (entry set))
           (make-tree (entry set) (left-branch set)
                      (adjoin-set x (right-branch set))))))

(define (union-set set1 set2)
    (define (union-set-list set1 set2-list)
        (if (null? set2-list)
            set1
            (union-set-list (adjoin-set (car set2-list) set1) (cdr set2-list))))
    (union-set-list set1 (tree->list-1 set2)))


(define (intersection-set-list set1 set2)
    (if (or (null? set1) (null? set2))
        '()
        (let ((x1 (car set1)) (x2 (car set2)))
            (cond ((= x1 x2)
                   (cons x1 (intersection-set-list (cdr set1)
                                              (cdr set2))))
                  ((< x1 x2)
                   (intersection-set-list (cdr set1) set2))
                  ((< x2 x1)
                   (intersection-set-list set1 (cdr set2)))))))

(define (intersection-set set1 set2)
        (list->tree (intersection-set-list (tree->list-1 set1) (tree->list-1 set2))))

;;; Tests:
;;; (tree->list-1 (union-set (list->tree (list 1 3 5 8)) (list->tree (list 3 4 5))))
;;; (tree->list-1 (intersection-set (list->tree (list 1 2 3 4 5)) (list->tree (list 2 3 4 8))))