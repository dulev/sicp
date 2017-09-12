#lang sicp

(define (smallest-divisor n)
  (define (find-next-div n div)
    (if (<= (square div) n)
        (if (= (remainder n div) 0)
            div
            (find-next-div n (+ div 1)))
        n))
  (find-next-div n 2))

(define (square n)
  (* n n))

(smallest-divisor 199)
(smallest-divisor 1999)
(smallest-divisor 19999)