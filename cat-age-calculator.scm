(import (chicken format)
        (chicken process-context))

; recursion baby!
(define (calculate-age years cat-age)
(cond
    [(= years 0)
       cat-age]
    [(= years 1)
		(calculate-age (sub1 years) (+ cat-age 15))]
    [(= years 2)
        (calculate-age (sub1 years) (+ cat-age 9))]
    [(> years 2)
        (calculate-age (sub1 years) (+ cat-age 4))]))

; tedious checking of arguments
(if (not (= (length (command-line-arguments)) 1))
    (begin
    (display "argument must be one (1) integer\n")
     (exit 1)))

(if (not (integer? (string->number (car (command-line-arguments)))))
    (begin
    (display "argument must be an integer\n")
    (exit 1)))

(if (not (> (string->number (car (command-line-arguments))) 0))
     (begin
       (display "argument must be integer larger than 0\n")
       (exit 1)))

; do the stuff
(define cat-age (calculate-age (string->number (car (command-line-arguments))) 0))

; print the stuff
(printf "Your cat's age is equivalent to ~a human years old.\n" cat-age)
