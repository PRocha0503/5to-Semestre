#|
    read files in racket
    Pablo Rocha
    2022-03-11
|# 

#lang racket

(define (read-file file-name name)
    (display-to-file (
        (string-downcase (file->string file-name))
        name
        #:exists "truncate"
    ))
)