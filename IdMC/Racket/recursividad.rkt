#|
    Recursividad  en racket
    Pablo Rocha
    2022-03-05
|# 

#lang racket
; Librerias 
(require racket/trace)

; Ejercicio: factorial
(provide factorial)

(define (factorial num) (if (= num 0) 1 (* (factorial (- num 1)) num)))

(factorial 0)
(factorial 5)


(define (factorialHide n) 
(define (factorialTail num a) 
    (if (zero? num) a (factorialTail (- num 1) (* num a)))) (factorialTail n 1))

(factorialHide 5)


(define (sum lst) 
    "Sum elements in a list"
    (let loop 
    ([lst lst] [result 0])
    (if (empty? lst)
        result
        (loop (cdr lst) (+ (car lst) result))
    )
    )
)

(sum (list 1 4 3 5))

; En modo it te sale las llamdas
(trace factorial)