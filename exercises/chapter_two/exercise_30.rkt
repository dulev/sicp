#lang sicp

(define (square x) (* x x))

(define (square-tree tree)
    (cond ((null? tree) nil)
          ((not (pair? tree)) (square tree))
          (else (cons (square-tree (car tree))
                      (square-tree (cdr tree))))))

(define (square-tree-with-map tree)
    (define (square-subtree subtree)
        (if (not (pair? subtree))
            (square subtree)
            (square-tree-with-map subtree)))
    (map square-subtree tree))

;;; (define x (list 1
;;;                 (list 2 (list 3 4) 5)
;;;                 (list 6 7)))
;;; (display (square-tree x))
;;; (display (square-tree-with-map x))
