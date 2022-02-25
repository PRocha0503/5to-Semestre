#|
    First examples in racket
    Pablo Rocha
    2022-02-22
|# 

#lang racket

; Nota: En racket las funciones se escriben con parentesis afuera, por ejemplo (+ 3 4) o (> 6 9)
(+ 3 4)

; Nota: para definir variables en racket se hace con la funcion define (define test 34), no se tiene que poner tipo.
(define test 34)
(print test)
(display "\n")

; Nota: para definir funciones se hace asi (define (nombre argumento argumento) (/ (* base height) 2))
(define (triangle base height)
 (/ (* base height) 2.0))

(triangle 7 3)

; Nota: Hacer visible la funcion cuando cargue el archivo, pones racket -it y el nombre
(provide triangle)

; Ejercicio Calcular cuando aluien cumplira 100 años
(define  (hundredYears age currentYear) (+ currentYear (- 100 age)))
(hundredYears 21 2022)
(hundredYears 15 2022)
(provide triangle)

; Ejercicio Numero de lustros que ha vivido una persona 

(define (lustrums birthYear currentYear) (/ (- currentYear birthYear) 5.0))
(lustrums 2000 2022)

; Ejercicio: peso que debe bajar una persona por mes

(define (kilosPerMonth iWeigth fWeigth months) (/ (- iWeigth fWeigth) months))
(kilosPerMonth 55 50 4.0)

; Ejercicio: peso que debe bajar una persona por mes

(define (distanceBetweenPoints x1 y1 x2 y2) (/ (- y2 y1) (- x2 x1)))
(distanceBetweenPoints 3.6 -1.3 8.6 2.5)

; Ejercicio: calcular cuenta de celular (0.8 por mensaje,mega,etc..)

(define (phoneBill mes megas min) (+ (* 0.8 mes) (* 0.8 megas) (* 0.8 min)))
(phoneBill 38 3.1 78)

; Ejercicio: PEMDAS operaciones

; Nota: Funcion de asistencia para redondear
(define (roundToDecimals number ) (string->number (~r #:precision '(= 4) number)))

(define (PEMDAS) (values (oper1) (oper2)))
(define (oper1) (roundToDecimals (- (+ (* 2 .75) (* 4 (/ 2 3)) (* 5 .5)) (* 3 .2))))
(define (oper2) (roundToDecimals(- (+ (* 2 35) (* 4 (expt 36 (/ 3 2)))) (* 6 49))))

(PEMDAS)

