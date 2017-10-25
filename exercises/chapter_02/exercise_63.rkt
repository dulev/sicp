#lang sicp

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
    (list entry left right))

(define (element-of-set? x set)
    (cond ((null? set) false)
          ((= x (entry set)) true)
          ((< x (entry set))
           (element-of-set? x (left-branch set)))
          ((> x (entry set))
           (element-of-set? x (right-branch set)))))

(define (adjoin-set x set)
    (cond ((null? set) (make-tree x '() '()))
          ((= x (entry set)) set)
          ((< x (entry set))
           (make-tree (entry set)
                      (adjoin-set x (left-branch set))
                      (right-branch set)))
          ((> x (entry set))
           (make-tree (entry set)
                      (left-branch set)
                      (adjoin-set x (right-branch set))))))

(define (tree->list-1 tree)
    (if (null? tree)
        '()
        (append (tree->list-1 (left-branch tree))
                (cons (entry tree)
                      (tree->list-1
                        (right-branch tree))))))
(define (tree->list-2 tree)
    (define (copy-to-list tree result-list)
        (if (null? tree)
            result-list
            (copy-to-list (left-branch tree)
                          (cons (entry tree)
                                (copy-to-list
                                    (right-branch tree)
                                    result-list)))))
    (copy-to-list tree '()))

;;;     4
;;;    / \
;;;   2   5
;;;  / \
;;; 1   3
;;; (tree->list-1 (list 4 (list 2 (list 1 nil nil) (list 3 nil nil)) (list 5 nil nil)))
;;; (tree->list-2 (list 4 (list 2 (list 1 nil nil) (list 3 nil nil)) (list 5 nil nil)))

;;;   2
;;;  / \
;;; 1   4
;;;    / \
;;;   3   5
;;; (tree->list-1 (list 2 (list 1 nil nil) (list 4 (list 3 nil nil) (list 5 nil nil))))
;;; (tree->list-2 (list 2 (list 1 nil nil) (list 4 (list 3 nil nil) (list 5 nil nil))))

;;; a) We can see that both procedures produce the same lists.
;;; b) Each node of the tree is visited only once, so the number of
;;;    steps required to convert a tree to a list stays the same.
;;;    The append maybe makes a slight difference but it doesn't matter
;;;    that much.

(#%provide (all-defined))