#lang sicp

(define (multiply a b)
  (cond ((< a 0) (multiply (- a) (- b)))
        ((or (= a 0) (= b 0)) 0)
        ((= a 1) b)
        ((even? a) (multiply (halve a) (double b)))
        (else (+ b (multiply (- a 1) b)))))

(define (even? n)
  (= (/ n 2) 0))

(define (double n)
  (* 2 n))

(define (halve n)
  (/ n 2))

(multiply 3 5)
(multiply 1000 -100000)
(multiply -1000 100000)