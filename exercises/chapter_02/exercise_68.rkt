#lang sicp

(#%require "exercise_67.rkt")

(define (encode message tree)
    (if (null? message)
        '()
        (append (encode-symbol (car message) tree)
                (encode (cdr message) tree))))

(define (encode-symbol sym tree)
    (if (member sym (symbols tree))
        (cond [(leaf? tree) '()]
              [(member sym (symbols (left-branch tree)))
               (cons 0 (encode-symbol sym (left-branch tree)))]
              [(member sym (symbols (right-branch tree)))
               (cons 1 (encode-symbol sym (right-branch tree)))])
        (error "ERROR: SYMBOL NOT IN ENCODING TABLE - " sym)))

;;; (display sample-tree)
;;; (display (encode '(A D A B B C A) sample-tree))

(#%provide (all-defined))