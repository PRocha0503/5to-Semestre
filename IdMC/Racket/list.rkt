#|
    Lists on racket
    Pablo Rocha
    2022-03-05
|# 

#lang racket

; se definen ´(4 . 7) o asi

(define data (cons 1 2))
(car data)
(cdr data)

(cons 1 (cons 2 (cons 3 (cons 4 null))))
(define da (list 1 2 3 4 5))
(cdr da)
(car (cdr da))