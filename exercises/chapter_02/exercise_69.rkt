#lang sicp

(#%require "exercise_67.rkt")

(define (generate-huffman-tree pairs)
    (successive-merge (make-leaf-set pairs)))

(define (successive-merge trees)
    (define (insert-correctly subtree trees)
        (cond [(null? trees) (list subtree)]
              [(< (weight subtree) (weight (car trees)))
               (cons subtree trees)]
              [else (cons (car trees) (insert-correctly subtree (cdr trees)))]))
    (if (= (length trees) 1)
        (car trees)
        (let ([first (car trees)]
              [second (cadr trees)]
              [rest (cddr trees)])
            (successive-merge (insert-correctly (make-code-tree first second) rest)))))

;;; (display (generate-huffman-tree (list (list 'A 7) (list 'B 3) (list 'C 1) (list 'D 1))))

(#%provide (all-defined))
