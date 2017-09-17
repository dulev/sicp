#lang sicp

(#%require "exercise_02.rkt")
;;; First implementation:
(define (make-rect bot-left top-right)
    (cons bot-left top-right))
(define (rect-bot-left rect) (car rect))
(define (rect-top-right rect) (cdr rect))

;;; Second implementation can be done
;;; but it is inefficient in the calculation of
;;; horizontal and vertical size selectors.
;;; We can only solve this problem by breaking
;;; the abstraction layers.
;;; (define (make-rect bot-left h-size v-size)
;;;     (cons bot-left (cons h-size v-size)))
;;; (define (rect-bot-left rect) (car rect))
;;; (define (rect-top-right rect)
;;;     (let ((bot-left-x (x-point (rect-bot-left rect)))
;;;           (bot-left-y (y-point (rect-bot-left rect))))
;;;         (make-point (+ bot-left-x (car (cdr rect)))
;;;                     (+ bot-left-y (cdr (cdr rect))))))

;;; Next Abstraction Layer
(define (rect-left-x rect)
    (x-point (rect-bot-left rect)))
(define (rect-right-x rect)
    (x-point (rect-top-right rect)))
(define (rect-top-y rect)
    (y-point (rect-top-right rect)))
(define (rect-bot-y rect)
    (y-point (rect-bot-left rect)))

;;; Next Abstraction Layer
(define (rect-h-size rect)
    (- (rect-right-x rect) (rect-left-x rect)))
(define (rect-v-size rect)
    (- (rect-top-y rect) (rect-bot-y rect)))

;;; Next Abstraction Layer
(define (rect-perimeter rect)
    (+ (* 2 (rect-h-size rect))
       (* 2 (rect-v-size rect))))
(define (rect-volume rect)
    (* (rect-h-size rect) (rect-v-size rect)))

;;; Implementations testing:
;;; (define point-a (make-point 0 0))
;;; (define point-b (make-point 2 1))
;;; (define test-rect (make-rect point-a point-b))
;;; (define test-rect (make-rect point-a 2 1))
;;; (rect-perimeter test-rect)
;;; (rect-volume test-rect)