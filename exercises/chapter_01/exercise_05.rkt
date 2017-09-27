#lang sicp

;; An interpreter that uses applicative-order
;; evaluation would try to evaluate the operand
;; (p) before applying the procedure test.
;; But the procedure p starts recursively calling itself
;; and the interpreter falls into an "endless" loop.
;;
;; On the other hand if the interpreter uses
;; normal-order evaluation operands would not be
;; evaluated immediately. Since the first argument is
;; 0, the if would return 0 and the y would never
;; be evaluated. Consequently the program would not
;; loop infinitely.

(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))

(test 0 (p))
