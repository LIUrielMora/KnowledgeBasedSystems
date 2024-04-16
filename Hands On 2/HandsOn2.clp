(assert (enfermedad varisela lesiones_en_piel fiebre perdida_de_apetito dolor_de_cabeza))
(assert (enfermedad sarampion fiebre manchas_en_boca tos moqueo))
(assert (enfermedad conjuntivitis ojos_rojos hinchazon_en_parpados picazon_ocular cuerpo_extraño_ocular))
(assert (enfermedad escarlatina erupcion lengua_de_fresa escalofrios dolor_de_garganta))
(assert (enfermedad influenza fiebre fatiga_visible tos dolor_de_garganta))
(assert (enfermedad asma sibilancias dificultar_respirar_visible dolor_en_pecho tos))

(assert
    (signo lesiones_en_piel)
    (signo fiebre)
    (signo manchas_en_boca)
    (signo ojos_rojos)
    (signo hinchazon_en_parpados)
    (signo erupcion)
    (signo lengua_de_fresa)
    (signo fatiga_visible )
    (signo sibilancias)
    (signo dificultar_respirar_visible) 
)

(assert
    (sintoma perdida_de_apetito)
    (sintoma dolor_de_cabeza)
    (sintoma tos)
    (sintoma moqueo)
    (sintoma picazon_ocular)
    (sintoma cuerpo_extraño_ocular)
    (sintoma escalofrios)
    (sintoma dolor_de_garganta)
    (sintoma dolor_en_pecho )
)

; En caso de querer buscar por algún parametro especifico se deberá eliminar la variable ?nombre e ingresar el nombre de la enfermedad
; Ej.  (enfermedad influenza)

; ================ Busca Enfermedad ================
(defrule busca-enfermedad
 ?enf <- (enfermedad influenza)
 => 
    (printout t Enfermedad:  influenza crlf)
    (printout t signos:  ?signo1 ,  ?signo2 crlf)
    (printout t sintomas:   ?sintoma1 , ?sintoma2 crlf crlf))

; ================ Busca Signo  ================
(defrule busca-signo
 ?enf <- (signo ?signo)
 => 
(printout t Signo: ?signo crlf crlf))

; ================ Busca Sintoma  ================
(defrule busca-sintoma
 ?enf <- (sintoma ?sintoma)
 => 
(printout t Sintoma: ?sintoma crlf crlf))

; ================ Elimina Enfermedad  ================
(defrule eliminar-enfermedad
    ?enf <- (enfermedad influenza)
    =>
    (retract ?enf)
    (printout t "Enfermedad: " ?nombre " eliminada." crlf)
)
