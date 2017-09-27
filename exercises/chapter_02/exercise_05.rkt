#lang sicp

(define (cons a b)
    (* (expt 2 a) (expt 3 b)))

(define (remove-k-count-n k n z)
    (define (remove-k z)
        (if (= 0 (remainder z k))
            (remove-k (/ z k))
            z))
    (define (count-n z)
        (if (= (/ z n) 1)
            1
            (+ 1 (count-n (/ z n)))))
    (count-n (remove-k z)))

(define (car z)
    (remove-k-count-n 3 2 z))
(define (cdr z)
    (remove-k-count-n 2 3 z))

;;; (define pair (cons 1278 17))
;;; (car pair)
;;; (cdr pair)