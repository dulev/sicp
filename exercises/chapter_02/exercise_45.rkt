#lang sicp
(#%require sicp-pict)

(#%require "exercise_44.rkt")

(define (split a b)
    (define (split-proc painter n)
        (if (= n 0)
            painter
            (let ((smaller (split-proc painter (- n 1))))
                (a painter (b smaller smaller)))))
    split-proc)

(define right-split-alt (split beside below))
(define up-split-alt (split below beside))

;;; (paint (right-split-alt einstein 3))
;;; (paint (up-split-alt einstein 3))