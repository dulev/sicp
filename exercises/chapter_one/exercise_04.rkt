#lang sicp

;; The applicative-order evaluation allows
;; for the dynamic evaluation of the operator.
;; The operator is evaluated and only then is the
;; procedure, determined by the operator, applied.
;;
;; Example for a-plus-abs-b:
;; The expression (if (> b 0) + -) evaluates to + and
;; the expression, defining the procedure a-plus-abs-b,
;; is now (+ a b).

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(a-plus-abs-b 5 -10)
(a-plus-abs-b 5 10)