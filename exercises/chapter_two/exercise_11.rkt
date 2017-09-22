#lang sicp

(#%require "exercise_07.rkt")

;;; This implementaiton is much worse than the
;;; the original due to the horrible maintainability.

(define (mul-interval-new x y)
    (let ((lo-x (lower-bound x))
          (up-x (upper-bound x))
          (lo-y (lower-bound y))
          (up-y (upper-bound y)))
        (cond ((and (>= lo-x 0) (>= up-x 0) (>= lo-y 0) (>= up-y 0))
               (make-interval (* lo-x lo-y) (* up-x up-y)))
              ((and (>= lo-x 0) (>= up-x 0) (<= lo-y 0) (>= up-y 0))
               (make-interval (* up-x lo-y) (* up-x up-y)))
              ((and (>= lo-x 0) (>= up-x 0) (<= lo-y 0) (<= up-y 0))
               (make-interval (* up-x lo-y) (* lo-x up-y)))
               
              ((and (<= lo-x 0) (>= up-x 0) (>= lo-y 0) (>= up-y 0))
               (make-interval (* lo-x up-y) (* up-x up-y)))
              ((and (<= lo-x 0) (>= up-x 0) (<= lo-y 0) (>= up-y 0))
               (make-interval (min (* lo-x up-y) (* up-x lo-y))
                              (max (* lo-x lo-y) (* up-x up-y))))
              ((and (<= lo-x 0) (>= up-x 0) (<= lo-y 0) (<= up-y 0))
               (make-interval (* up-x lo-y) (* lo-x lo-y)))
                 
              ((and (<= lo-x 0) (<= up-x 0) (>= lo-y 0) (>= up-y 0))
               (make-interval (* lo-x up-y) (* up-x lo-y)))
              ((and (<= lo-x 0) (<= up-x 0) (<= lo-y 0) (>= up-y 0))
               (make-interval (* lo-x up-y) (* lo-x lo-y)))
              ((and (<= lo-x 0) (<= up-x 0) (<= lo-y 0) (<= up-y 0))
               (make-interval (* up-x lo-y) (* lo-x up-y))))))