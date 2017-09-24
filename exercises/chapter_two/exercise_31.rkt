#lang sicp

(define (square x) (* x x))

(define (tree-map proc tree)
    (map (lambda (subtree)
            (if (not (pair? subtree))
                (proc subtree)
                (tree-map proc subtree)))
         tree))

(define (square-tree tree) (tree-map square tree))

;;; (define x (list 1
;;;                 (list 2 (list 3 4) 5)
;;;                 (list 6 7)))
;;; (display (square-tree x))