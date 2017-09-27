#lang sicp
(#%require sicp-pict)

(define (flip-horiz painter)
    (define origin (make-vect 0 1))
    (define edge1 (make-vect 1 1))
    (define edge2 (make-vect 0 0))
    ((transform-painter origin edge1 edge2) painter))

(define (rotate90 painter)
    (define origin (make-vect 0 1))
    (define edge1 (make-vect 0 0))
    (define edge2 (make-vect 1 1))
    ((transform-painter origin edge1 edge2) painter))

(define (rotate-counter-180 painter)
    (rotate90 (rotate90 painter)))

(define (rotate-counter-270 painter)
    (rotate90 painter))

;;; (paint einstein)
;;; (paint (flip-horiz einstein))
;;; (paint (rotate90 einstein))
;;; (paint (rotate-counter-180 einstein))