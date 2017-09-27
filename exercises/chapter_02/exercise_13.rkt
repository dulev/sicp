#lang sicp

(#%require "exercise_07.rkt" "exercise_12.rkt")

(define (par1 r1 r2)
    (div-interval (mul-interval r1 r2)
                  (add-interval r1 r2)))
(define (par2 r1 r2)
    (let ((one (make-interval 1 1)))
        (div-interval one 
                      (add-interval (div-interval one r1)
                                    (div-interval one r2)))))

;;; The percentage tolerance of the product
;;; appears to be the sum of the tolerances of
;;; the two factors.

;;; (define t1 (make-center-percent 3 5))
;;; (define t2 (make-center-percent 5 2.5))

;;; (define prod (mul-interval t1 t2))
;;; (center prod)
;;; (percent prod)

(#%provide (all-defined))