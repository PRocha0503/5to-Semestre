;;; Identificar operaciones

#lang racket
(require racket/trace)

; Explicacion: Estructura del dfa
(struct dfa-str (initial-state accept-states transitions))

(define(automatas-1 dfa string) 
    "Evaluar si un string es valido deacuerdo al DFA"
    (trace-let loop 
    (
        [state (dfa-str-initial-state dfa)] 
        [chars (string->list string)]
    )
    (if (empty? chars) 
        (member state (dfa-str-accept-states dfa))
        (loop ((dfa-str-transitions dfa) state (car chars)) (cdr chars))
    ))
)

(define (operator? char) 
    (member char '(#\+ #\- #\* #\/ #\=))
)
(define (sign? char) 
    (member char '(#\+ #\-))
)

(define (delta-arithmetic-1 state character)
    "Transition to idntify basic arithmetic operations"
    (case state 
        [("start") (cond 
            [(char-numeric? character) "int"]
            [(sign? character) "n_sign"]
            [else "fail"])]
        [("n_sign") (cond 
            [(char-numeric? character) "int"]
            [else "fail"]
        )
        ]
        [("int") (cond 
            [(char-numeric? character) "int"]
            [(sign? character) "op"]
            [(operator? character) "op"]
            [else "fail"]
        )
        ]
        [("op") (cond 
            [(char-numeric? character) "int"]
            [(sign? character) "n_sign"]
            [else "fail"]
        )]

    )
)


(automatas-1 (dfa-str "start" '("int") delta-arithmetic-1) "-3")
(automatas-1 (dfa-str "start" '("int") delta-arithmetic-1) "-3+*3")
(automatas-1 (dfa-str "start" '("int") delta-arithmetic-1) "3*6")
(automatas-1 (dfa-str "start" '("int") delta-arithmetic-1) "ab")

