#lang sicp

(#%require "exercise_40.rkt")

(define empty-board nil)
(define (adjoin-position new-row new-col positions)
    (append (list (list new-col new-row)) positions))

(define (pos-row position) (cadr position))
(define (pos-col position) (car position))

;;; Plain "and" doesn't work with accumulate,
;;; so I wrapped it with another procedure.
(define (and-workaround x y)
    (and x y))
(define (safe-queens? q1 q2)
    (and (not (= (pos-row q1) (pos-row q2)))
         (not (= (abs (- (pos-row q1) (pos-row q2)))
                 (abs (- (pos-col q1) (pos-col q2)))))))
(define (safe? col positions)
    (let ((new-queen-pos (car (filter (lambda (p) (= (pos-col p) col)) positions))))
        (accumulate and-workaround
                    true
                    (map (lambda (old-queen-pos)
                            (safe-queens? old-queen-pos new-queen-pos))
                         (filter (lambda (p) 
                                     (not (and (= (pos-row new-queen-pos) (pos-row p))
                                               (= (pos-col new-queen-pos) (pos-col p))))) 
                                 positions)))))

;;; Code provided in the exercise:
(define (queens board-size)
    (define (queen-cols k)
        (if (= k 0)
            (list empty-board)
            (filter 
                (lambda (positions) (safe? k positions))
                (flatmap
                    (lambda (rest-of-queens)
                        (map (lambda (new-row)
                                 (adjoin-position
                                  new-row k rest-of-queens))
                             (enumerate-interval 1 board-size)))
                    (queen-cols (- k 1))))))
    (queen-cols board-size))

;;; (display (queens 4))