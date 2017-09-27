#lang sicp
(#%require sicp-pict)

(define (below painter1 painter2)
    (let ((split-point (make-vect 0 0.5)))
        (let ((paint-bot
               ((transform-painter
                    (make-vect 0 0)
                    (make-vect 1 0)
                    split-point) painter1))
              (paint-top
               ((transform-painter
                    split-point
                    (make-vect 1 0.5)
                    (make-vect 0 1)) painter2)))
            (lambda (frame)
                (paint-bot frame)
                (paint-top frame)))))

(define (below-alt painter1 painter2)
    (rotate90 (beside (rotate270 painter1) (rotate270 painter2))))

;;; (paint (below einstein einstein))
;;; (paint (below-alt einstein einstein))