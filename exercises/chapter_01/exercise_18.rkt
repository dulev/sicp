#lang sicp

(define (multiply a b)
	(define (multiply a b c)
    (cond ((= a 0) c)
          ((< a 0) (multiply (- a) (- b) c))
          (else (if (even? a)
                    (multiply (halve a) (double b) c)
                    (multiply (- a 1) b (+ c b))))))   
  (multiply a b 0))

(define (even? n)
  (= (/ n 2) 0))

(define (double n)
  (* 2 n))

(define (halve n)
  (/ n 2))

(multiply 100 100)
(multiply -15 15)
(multiply 15 -15)