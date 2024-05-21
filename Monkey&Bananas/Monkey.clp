(deftemplate estado
   (slot monkey)
   (slot banana)
   (slot chair)
   (slot desk)
)

(deftemplate estado-objeto
   (slot objeto)
   (slot estado)
)

(deftemplate posicion
   (slot objeto)
   (slot lugar)
)

(deftemplate peso
   (slot objeto)
   (slot valor)
)

(deffacts estado-inicial
   (estado (monkey hambriento) (banana colgando) (chair suelo) (desk suelo))
   (estado-objeto (objeto monkey) (estado reposo))
   (estado-objeto (objeto desk) (estado reposo))
   (estado-objeto (objeto chair) (estado reposo))
   (estado-objeto (objeto banana) (estado reposo))
   (posicion (objeto monkey) (lugar entrada))
   (posicion (objeto banana) (lugar centro))
   (posicion (objeto desk) (lugar esquina))
   (posicion (objeto chair) (lugar contraesquina))
   (peso (objeto monkey) (valor ligero))
   (peso (objeto desk) (valor mediano))
   (peso (objeto chair) (valor ligero))
   (peso (objeto banana) (valor ligero))
)

(defrule tomar-banana
   ?e <- (estado (monkey sobre-chair) (banana colgando) (chair encima-desk) (desk suelo))
   ?mo <- (estado-objeto (objeto monkey) (estado reposo))
   ?bo <- (estado-objeto (objeto banana) (estado reposo))
   =>
   (printout t "Regla 1: Mono toma banana" crlf)
   (retract ?e ?mo ?bo)
   (assert (estado (monkey sobre-chair) (banana cargada) (chair encima-desk) (desk suelo)))
   (assert (estado-objeto (objeto monkey) (estado cargando)))
   (assert (estado-objeto (objeto banana) (estado cargado)))
)

(defrule comer-banana
   ?e <- (estado (monkey sobre-chair) (banana cargada) (chair encima-desk) (desk suelo))
   ?mo <- (estado-objeto (objeto monkey) (estado cargando))
   ?bo <- (estado-objeto (objeto banana) (estado cargado))
   =>
   (printout t "Regla 2: Mono come banana" crlf)
   (retract ?e ?mo ?bo)
   (assert (estado (monkey saciado) (banana comida) (chair encima-desk) (desk suelo)))
   (assert (estado-objeto (objeto monkey) (estado reposo)))
)

(defrule cargar-escritorio
   ?e <- (estado (monkey hambriento) (banana colgando) (chair suelo) (desk suelo))
   ?mo <- (estado-objeto (objeto monkey) (estado reposo))
   ?do <- (estado-objeto (objeto desk) (estado reposo))
   ?mp <- (peso (objeto monkey) (valor ligero|mediano))
   ?dp <- (peso (objeto desk) (valor mediano))
   ?mpo <- (posicion (objeto monkey) (lugar entrada))
   ?dpo <- (posicion (objeto desk) (lugar esquina))
   =>
   (printout t "Regla 3: Mono carga escritorio" crlf)
   (retract ?e ?mo ?do ?mpo ?dpo)
   (assert (estado (monkey hambriento) (banana colgando) (chair suelo) (desk cargando)))
   (assert (estado-objeto (objeto monkey) (estado cargando)))
   (assert (estado-objeto (objeto desk) (estado cargado)))
   (assert (posicion (objeto desk) (lugar centro)))
)

(defrule cargar-silla
   ?e <- (estado (monkey hambriento) (banana colgando) (chair suelo) (desk suelo))
   ?mo <- (estado-objeto (objeto monkey) (estado reposo))
   ?co <- (estado-objeto (objeto chair) (estado reposo))
   ?cp <- (peso (objeto chair) (valor ligero))
   ?mp <- (peso (objeto monkey) (valor ligero))
   ?cpo <- (posicion (objeto chair) (lugar contraesquina))
   ?dpo <- (posicion (objeto desk) (lugar centro))
   =>
   (printout t "Regla 4: Mono carga silla" crlf)
   (retract ?e ?mo ?co ?cpo)
   (assert (estado (monkey hambriento) (banana colgando) (chair cargando) (desk suelo)))
   (assert (estado-objeto (objeto monkey) (estado cargando)))
   (assert (estado-objeto (objeto chair) (estado cargado)))
   (assert (posicion (objeto chair) (lugar centro)))
)

(defrule subir-silla
   ?e <- (estado (monkey hambriento) (banana colgando) (chair encima-desk) (desk suelo))
   ?mo <- (estado-objeto (objeto monkey) (estado reposo))
   =>
   (printout t "Regla 5: Mono sube silla" crlf)
   (retract ?e ?mo)
   (assert (estado (monkey sobre-chair) (banana colgando) (chair encima-desk) (desk suelo)))
   (assert (estado-objeto (objeto monkey) (estado reposo)))
   (assert (posicion (objeto monkey) (lugar silla)))
)

(defrule mover-escritorio-debajo-de-banana
   ?e <- (estado (monkey hambriento) (banana colgando) (chair suelo) (desk cargando))
   ?mo <- (estado-objeto (objeto monkey) (estado cargando))
   ?do <- (estado-objeto (objeto desk) (estado cargado))
   ?dp <- (posicion (objeto desk) (lugar centro))
   =>
   (printout t "Regla 6: Mono mueve escritorio debajo de la banana" crlf)
   (retract ?e)
   (assert (estado (monkey hambriento) (banana colgando) (chair suelo) (desk bajo-banana)))
)


(defrule mover-silla-hacia-escritorio
   ?e <- (estado (monkey hambriento) (banana colgando) (chair cargando) (desk suelo))
   ?mo <- (estado-objeto (objeto monkey) (estado cargando))
   ?co <- (estado-objeto (objeto chair) (estado cargado))
   ?cp <- (posicion (objeto chair) (lugar centro))
   ?dp <- (peso (objeto desk) (valor mediano))
   =>
   (printout t "Regla 7: Mono lleva silla hacia escritorio" crlf)
   (retract ?e ?dp)
   (assert (estado (monkey hambriento) (banana colgando) (chair encima-desk) (desk suelo)))
   (assert (peso (objeto desk) (valor pesado)))
)

(defrule bajar-escritorio
   ?e <- (estado (monkey hambriento) (banana colgando) (chair suelo) (desk bajo-banana))
   ?mo <- (estado-objeto (objeto monkey) (estado cargando))
   ?do <- (estado-objeto (objeto desk) (estado cargado))
   =>
   (printout t "Regla 8: Mono baja escritorio" crlf)
   (retract ?e ?mo ?do)
   (assert (estado (monkey hambriento) (banana colgando) (chair suelo) (desk suelo)))
   (assert (estado-objeto (objeto monkey) (estado reposo)))
   (assert (estado-objeto (objeto desk) (estado reposo)))
)

(defrule bajar-silla-encima-de-escritorio
   ?e <- (estado (monkey hambriento) (banana colgando) (chair encima-desk) (desk suelo))
   ?mo <- (estado-objeto (objeto monkey) (estado cargando))
   ?co <- (estado-objeto (objeto chair) (estado cargado))
   =>
   (printout t "Regla 9: Mono baja silla encima de escritorio" crlf)
   (retract ?e ?mo ?co)
   (assert (estado (monkey hambriento) (banana colgando) (chair encima-desk) (desk suelo)))
   (assert (estado-objeto (objeto monkey) (estado reposo)))
   (assert (estado-objeto (objeto chair) (estado reposo)))
)

(defrule mono-baja
   ?e <- (estado (monkey saciado) (banana comida) (chair encima-desk) (desk suelo))
   ?mp <- (posicion (objeto monkey) (lugar silla))
   =>
   (printout t "Regla 10: Mono baja de silla y escritorio" crlf)
   (retract ?e ?mp)
   (assert (estado (monkey saciado) (banana comida) (chair encima-desk) (desk suelo)))
   (assert (posicion (objeto monkey) (lugar entrada)))
)

