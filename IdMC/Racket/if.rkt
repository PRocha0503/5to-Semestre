#|
    If statements in racket
    Pablo Rocha
    2022-02-22
|# 

#lang racket

(define (positive-or-negative number) (if (zero? number) "Number is cero" (if (> number 0) "Number is positive" "Number is negative")) )
(positive-or-negative 0)
(positive-or-negative -3)
(positive-or-negative 3)

(define (cond-pos number) 
    (cond [(zero? number) "Number is cero"] 
    [(> number 0) "Number is positive"] 
    [else "negative"]))
(cond-pos 4)

(define (days-in-month month year) 
    (case month 
    [(1) 31]
    [(2) (if (leap-year year) 29 28)]
    [(3) 31]
    [(4) 30]
    [(5) 31]
    ))


(define (leap-year year) 
(if (= (modulo year 400) 0) 
    #t 
    (if (= (modulo year 100) 0) 
        #f 
        (if (= (modulo year 4) 0) 
        #t 
        #f
        )
    )
))
(define (next-day year month day) 
    (if (= day (days-in-month month year)) 
        (if (= month 12) 
            (values (+ year 1) 1 1)
            (values year (+ month 1) 1)
        )
        (values year month (+ day 1))
    )
)


(days-in-month 2 2100)
(leap-year 2104)
(next-day 2022 2 25)
(next-day 2016 2 28)
(next-day 2016 2 29)
(next-day 2017 2 28)