#|
    Let  en racket
    Pablo Rocha
    2022-03-05
|# 

#lang racket

; let solo hace que soo exista localmente, como variables locales

(let 
    ([a 1] [b 2]) ;Declaraciones
    (+ a b) ;Ejecucion
)

; (define (! n) (
;     (let loop 
;     ([n n] [a 1]) 
;     (if (zero? n) 
;         a 
;         (loop (- n 1) (* n a))))
; ))

; (! 5)

; (define (fibo n) 
;     (cond 
;         [(= n 0) 0]
;         [(= n 1) 1]
;         [else (+ (fibo (- n 1) (fibo (- n 2))))]
;         ))
; (fibo 5)

(define (fibo-2 n) 
    (cond 
    [(= n 0) 0]
    [(= n 1) 1]
    [else (let loop ([n (- n 1)] [a 0] [b 1])
    (if (zero? n) b (loop (sub1 n) b (+ a b)))
    )]

))

(fibo-2 10)