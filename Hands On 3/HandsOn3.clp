; DEFINICIÓN DE REGLAS 
; =============== Reglas para Varisela según el Diagrama =============== 
(defrule hipertensionCase1
    (signo lesiones_en_piel)
    (or (sintoma perdida_de_apetito)
        (sintoma dolor_de_cabeza))
=>
    (assert (enfermedad varisela))
(printout t "Diagnostico: El paciente padece de varisela." crlf)
)

(defrule variselaCase2
    (signo fiebre)
     (or (sintoma perdida_de_apetito)
        (sintoma dolor_de_cabeza))
=>
    (assert (enfermedad varisela))
(printout t "Diagnostico: El paciente padece de varisela." crlf)
)

; =============== Reglas para Influenza según el Diagrama =============== 
(defrule influenzaCase1
    (signo fiebre)
    ((sintoma dolor_de_garganta))
=>
    (assert (enfermedad influenza))
(printout t "Diagnostico: El paciente padece de influenza." crlf)
)

(defrule influenzaCase2
    (signo fatiga_visible)
    (or (sintoma dolor_de_garganta)
        (sintoma tos))
=>
    (assert (enfermedad influenza))
(printout t "Diagnostico: El paciente padece de influenza." crlf)
)

; =============== Reglas para Sarampión según el Diagrama =============== 
(defrule sarampionCase1
    (signo manchas_en_boca)
    (or (sintoma tos)
        (sintoma moqueo))
=>
    (assert (enfermedad sarampion))
(printout t "Diagnostico: El paciente padece de sarampión." crlf)
)

(defrule sarampionCase2
    (signo fiebre)
    (sintoma moqueo)
=>
    (assert (enfermedad sarampion))
(printout t "Diagnostico: El paciente padece de sarampión." crlf)
)

; =============== En el caso especifico dónde no se pueda saber si es Sarampión o Influenza se deberá pedir un segundo sintoma
(defrule moreInfoNeeded
    (signo fiebre)
    (sintoma tos)
=>
(printout t "Falta información: Es necesario ingresar otro sintoma para dar un diagnostico correcto" crlf)
)

; =============== Reglas para Conjuntivitis según el Diagrama =============== 
(defrule conjuntivitisCase1
    (signo ojos_rojos)
    (or (sintoma picazon_ocular)
        (sintoma cuerpo_extraño_ocular))
=>
    (assert (enfermedad conjuntivitis))
(printout t "Diagnostico: El paciente padece de conjuntivitis." crlf)
)

(defrule conjuntivitisCase2
    (signo hinchazon_en_parpados)
    (or (sintoma picazon_ocular)
        (sintoma cuerpo_extraño_ocular))
=>
    (assert (enfermedad conjuntivitis))
(printout t "Diagnostico: El paciente padece de conjuntivitis." crlf)
)

; =============== Reglas para Escarlatina según el Diagrama =============== 
(defrule escarlantinaCase1
    (signo erupcion)
    (or (sintoma escalofrios)
        (sintoma dolor_de_garganta))
=>
    (assert (enfermedad escarlantina))
(printout t "Diagnostico: El paciente padece de escarlantina." crlf)
)

(defrule escarlantinaCase2
    (signo lengua_de_fresa)
    (or (sintoma escalofrios)
        (sintoma dolor_de_garganta))
=>
    (assert (enfermedad escarlantina))
(printout t "Diagnostico: El paciente padece de escarlantina." crlf)
)

; =============== Reglas para Asma según el Diagrama =============== 
(defrule asmaCase1
    (signo sibilancias)
    (or (sintoma dolor_en_pecho )
        (sintoma tos))
=>
    (assert (enfermedad asma))
(printout t "Diagnostico: El paciente padece de asma." crlf)
)

(defrule asmaCase2
    (signo dificultar_respirar_visible)
    (or (sintoma dolor_en_pecho )
        (sintoma tos))
=>
    (assert (enfermedad asma))
(printout t "Diagnostico: El paciente padece de asma." crlf)
)



