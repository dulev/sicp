#lang sicp



(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime))
  (newline))

(define (start-prime-test n start-time)
  (if (prime? n)
    (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))


(define (smallest-divisor n)
  (define (find-next-div n div)
    (if (<= (square div) n)
        (if (= (remainder n div) 0)
            div
            (find-next-div n (+ div 1)))
        n))
  (find-next-div n 2))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (square n)
  (* n n))