(import (chicken format)
        (chicken process-context))

; using set! and global variables are AFAIK not idiomatic Scheme
(define cat-age 0)

; recursion baby!
(define (calculate-age years)
    (if (= years 1)
        (set! cat-age (+ cat-age 15)))
    (if (= years 2)
        (set! cat-age (+ cat-age 9)))
    (if (> years 2)
        (set! cat-age (+ cat-age 4)))
    (if (not (= (sub1 years) 0))
        (calculate-age (sub1 years))))

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
(calculate-age (string->number (car (command-line-arguments))))

; print the stuff
(printf "Your cat's age is equivalent to ~a human years old.\n" cat-age)

