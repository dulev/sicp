#lang sicp

(#%require "exercise_38.rkt")

(define (reverse sequence)
    (fold-right (lambda (x y) (append y (list x))) nil sequence))
(define (reverse-alt sequence)
    (fold-left (lambda (x y) (cons y x)) nil sequence))

;;; (reverse (list 1 2 3))
;;; (reverse-alt (list 1 2 3))