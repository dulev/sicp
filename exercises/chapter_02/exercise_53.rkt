#lang sicp

(display (list 'a 'b 'c))
(display (list 'george))
(display (cdr '((x1 x2) (y1 y2))))
(display (cadr '((x1 x2) (y1 y2))))

(newline)

(pair? (car '(a short list)))
(memq 'red '((red shoes) (blue socks)))
(memq 'red '(red shoes blue socks))
