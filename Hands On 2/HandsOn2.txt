(assert (enfermedad influenza fiebre sibilancias dolor-de-garganta congestión-nasal))
(assert (enfermedad hipertensión dolor-de-cabeza dolor-en-las-articulaciones fatiga visión-borrosa))
(assert (enfermedad asma sibilancias dolor-en-las-articulaciones dificultad-para-respirar tos))
(assert (enfermedad gastroenteritis diarrea fiebre vomitos dolor-abdominal))
(assert (enfermedad artritis dolor-en-las-articulaciones fiebre hinchazón rigidez))
(assert (enfermedad migraña dolor-de-cabeza fiebre sensibilidad-a-la-luz fatiga))

(assert (signo fiebre))
(assert (signo dolor-de-cabeza))
(assert (signo sibilancias))
(assert (signo diarrea))
(assert (signo dolor-en-las-articulaciones))

(assert (sintoma dolor-de-garganta))
(assert (sintoma congestión-nasal))
(assert (sintoma fatiga))
(assert (sintoma visión-borrosa))
(assert (sintoma dificultad-para-respirar))
(assert (sintoma tos))
(assert (sintoma vomitos))
(assert (sintoma dolor-abdominal))
(assert (sintoma hinchazón))
(assert (sintoma rigidez))
(assert (sintoma nauseas))
(assert (sintoma sensibilidad-a-la-luz))

(defrule busca-enfermedad
 ?enf <- (enfermedad ?nombre ?signo1 ?signo2 ?sintoma1 ?sintoma2)
 => 
    (printout t Enfermedad:  ?nombre crlf)
    (printout t signos:  ?signo1 ,  ?signo2 crlf)
    (printout t sintomas:   ?sintoma1 , ?sintoma2 crlf crlf))

(defrule busca-signo
 ?enf <- (signo ?signo)
 => 
(printout t Signo: ?signo crlf crlf))

(defrule busca-sintoma
 ?enf <- (sintoma ?sintoma)
 => 
(printout t Sintoma: ?sintoma crlf crlf))

(defrule eliminar-enfermedad
    ?enf <- (enfermedad ?nombre ?signo1 ?signo2 ?sintoma1 ?sintoma2)
    =>
    (retract ?enf)
    (printout t "Enfermedad: " ?nombre " eliminada." crlf)
)
