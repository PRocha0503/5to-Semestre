;;; Identificar operaciones y regresar la lista

#lang racket
(require racket/trace)

; Explicacion: Estructura del dfa
(struct dfa-str (initial-state accept-states transitions))

(define(automatas-2 dfa string) 
    "Evaluar si un string es valido deacuerdo al DFA"
    (let loop 
    (
        [state (dfa-str-initial-state dfa)] 
        [chars (string->list string)]
        [result null]
    )
    (if (empty? chars) 
    ;;; (member state (dfa-str-accept-states dfa))
        (if (member state (dfa-str-accept-states dfa)) (append result (list state)) #f)
        (let-values ([(token state) ((dfa-str-transitions dfa) state (car chars))]) 
        (loop 
        state 
        (cdr chars)
        (if token (append result (list token)) result)
        )) 
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
            [(char-numeric? character) (values #f "int")]
            [(or (char-alphabetic? character) (eq? character #\_)) (values #f "var")]
            [(sign? character) (values #f "n_sign")]
            [else (values #f "fail")])]
        [("n_sign") (cond 
            [(char-numeric? character) (values #f "int")]
            [else (values #f "fail")]
        )
        ]
        [("int") (cond 
            [(char-numeric? character) (values #f "int")]
            [(operator? character) (values "int" "op")]
            [else (values #f "fail")]
        )
        ]
        [("var") (cond 
            [(or (char-alphabetic? character) (eq? character #\_) (char-numeric? character)) (values #f "var")]
            [(operator? character) (values "var" "op")]
            [else (values #f "fail")]
        )]
        [("op") (cond 
            [(char-numeric? character) (values "op" "int")]
            [(or (char-alphabetic? character) (eq? character #\_)) (values "op" "var")]
            [(sign? character) (values "op" "n_sign")]
            [else (values "op" "fail")]
        )]
        [("fail") (values #f "fail")]
    )
)


(automatas-2 (dfa-str "start" '("int" "var") delta-arithmetic-1) "-3")
(automatas-2 (dfa-str "start" '("int" "var") delta-arithmetic-1) "-3+*3")
(automatas-2 (dfa-str "start" '("int" "var") delta-arithmetic-1) "3*6")
(automatas-2 (dfa-str "start" '("int" "var") delta-arithmetic-1) "ab")

