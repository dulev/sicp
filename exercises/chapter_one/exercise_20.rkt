#lang sicp

;; NORMAL-ORDER EVALUTATION
;; Hardly comprehensible after the first few lines :(

(gcd 206 40)

(if (= 40 0)
    206
    (gcd 40 (remainder 206 40)))

(gcd 40 (remainder 206 40))

;; Remainder evaluated once
(if (= (remainder 206 40) 0))
    40
    (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))

(if (= 6 0)
    40
    (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))

(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))

;; Remainder evaluated once
(if (= (remainder 40 (remainder 206 40)) 0)
    (remainder 206 40)
    (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))

;; Remainder evaluated once
(if (= (remainder 40 6) 0)
    (remainder 206 40)
    (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))

(if (= 4 0)
    (remainder 206 40)
    (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))

(gcd (remainder 40 (remainder 206 40)) 
     (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))

;; Remainder evaluated once
(if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0)
    (remainder 40 (remainder 206 40))
    (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
         (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))

;; Remainder evaluated once
(if (= (remainder (remainder 206 40) (remainder 40 6)) 0)
    (remainder 40 (remainder 206 40))
    (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
         (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))

;; Remainder evaluated once
(if (= (remainder (remainder 206 40) 4) 0)
    (remainder 40 (remainder 206 40))
    (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
         (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))

;; Remainder evaluated once
(if (= (remainder 6 4) 0)
    (remainder 40 (remainder 206 40))
    (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
         (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))

(if (= 2 0)
    (remainder 40 (remainder 206 40))
    (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
         (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))

(gcd (remainder (remainder 206 40) 
                (remainder 40 (remainder 206 40)))
     (remainder (remainder 40 (remainder 206 40))
                (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))

(if (= (remainder (remainder 40 (remainder 206 40))
                  (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
       0)
    (remainder (remainder 206 40) 
               (remainder 40 (remainder 206 40)))
    (gcd (remainder (remainder 40 (remainder 206 40))
                    (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 
         (remainder (remainder (remainder 206 40) 
                               (remainder 40 (remainder 206 40))) 
                    (remainder (remainder 40 (remainder 206 40))
                               (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))

;; I will only calculate the predicate expression for "readability"

;; Remainder evaluated twice
(remainder (remainder 40 (remainder 206 40))
           (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))

;; Remainder evaluated twice
(remainder (remainder 40 6)
           (remainder (remainder 206 40) (remainder 40 6)))

;; Remainder evaluated twice
(remainder (remainder 40 6)
           (remainder 6 4))

;; Remainder evaluated once
(remainder 4 2)

0

;; The predicate evaluates to true so the first expression is evaluated
;; The final result is:

;; Remainder evaluated once
(remainder (remainder 206 40) 
           (remainder 40 (remainder 206 40)))

;; Remainder evaluated twice
(remainder (remainder 206 40)
           (remainder 40 6))

;; Remainder evaluated once
(remainder 6 4)

2

;; The remainder was evaluated a total of 18 times
;; using normal-order evaluation



;; APPLICATIVE-ORDER EVALUTATION
;; This one is much better.

(gcd 206 40)

(if (= 40 0)
    206
    (gcd 40 (remainder 206 40)))

;; Remainder evaluated once
(gcd 40 (remainder 206 40))

(gcd 40 6)

(if (= 6 0)
    40
    (gcd 6 (remainder 40 6)))

;; Remainder evaluated once
(gcd 6 (remainder 40 6))

(gcd 6 4)

(if (= 4 0)
    6
    (gcd 4 (remainder 6 4)))

;; Remainder evaluated once
(gcd 4 (remainder 6 4))

(gcd 4 2)

(if (= 2 0)
    4
    (gcd 2 (remainder 4 2)))

;; Remainder evaluated once
(gcd 2 (remainder 4 2))

(gcd 2 0)

(if (= 0 0)
    2
    (gcd 0 (remainder 2 0)))

2

;; The remainder was evaluated a total of 4 times
;; using applicative-order evaluation