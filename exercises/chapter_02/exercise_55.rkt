#lang sicp

(car ''abracadabra)

;;; The line (car ''abracadabra) evaluates to (car (quote 'abracadabra)) 
;;; and then evaluates to (car (quote (quote abracadabra))). That is why
;;; the result is 'quote.
