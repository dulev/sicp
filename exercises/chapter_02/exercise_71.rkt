#lang sicp

(#%require "exercise_67.rkt" "exercise_68.rkt" "exercise_69.rkt")

(define (range x y)
    (if (> x y)
        nil
        (cons x (range (+ x 1) y))))
(define (get-pairs n)
    (map (lambda (x) (list (integer->char (+ 64 x)) (expt 2 (- x 1)))) (range 1 n)))

;;; (display (generate-huffman-tree (get-pairs 3)))
;;; (display (generate-huffman-tree (get-pairs 5)))
;;; (display (generate-huffman-tree (get-pairs 10)))

;;; 1 bit is required to encode the most frequent symbol and
;;; n - 1 bits are required to encode the most infrequent symbol.
