#lang sicp

(define (recursive-f n)
  (cond ((< n 3) n)
        (else (+ (recursive-f (- n 1))
                 (* 2 (recursive-f (- n 2)))
                 (* 3 (recursive-f (- n 3)))))))

(define (iterative-f n)
  (define (f a b c n)
    (cond ((< n 0) n)
          ((= n 0) a)
          ((= n 1) b)
          ((= n 2) c)
          (else (f b c (+ c (* 2 b) (* 3 a)) (- n 1)))))
  (f 0 1 2 n))

(recursive-f -1)
(iterative-f -1)

(recursive-f 4)
(iterative-f 4)

(recursive-f 30)
(iterative-f 30)