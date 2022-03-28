;;; Implementación de automatas


#lang racket

; Explicacion: Estructura del dfa
(struct dfa-str (initial-state accept-states transitions))

(define(automatas-1 dfa string) 
    "Evaluar si un string es valido deacuerdo al DFA"
    (let loop 
    (
        [state (dfa-str-initial-state dfa)] 
        [chars (string->list string)]
    )
    (if (empty? chars) 
        (member state (dfa-str-accept-states dfa))
        (loop ((dfa-str-transitions dfa) state (car chars)) (cdr chars))
    ))
)

(define (delta-ab state character)
    "Funcion que solo acepta ab"
    (case state 
        [("q0") (case character 
            [(#\a) "q1"]
            [(#\b) "q3"]
            )
        ]
        [("q1") (case character 
            [(#\a) "q3"]
            [(#\b) "q2"]
            )
        ]
        [("q2") (case character 
            [(#\a) "q3"]
            [(#\b) "q3"]
            )
        ]
        [("q3") "q3"]

    )
)

(define (delta-aab state character)
    "Funcion que tiene que tener numero pares de a antes de la b y tiene que haber una b"
    (case state 
        [("q0") (case character 
            [(#\a) "q2"]
            [(#\b) "q1"]
            )
        ]
        [("q1") (case character 
            [(#\a) "q1"]
            [(#\b) "q1"]
            )
        ]
        [("q2") (case character 
            [(#\a) "q0"]
            [(#\b) "q3"]
            )
        ]
        [("q3") "q3"]

    )
)


(automatas-1 (dfa-str "q0" '("q2") delta-ab) "ab")
(automatas-1 (dfa-str "q0" '("q1") delta-aab) "aab")