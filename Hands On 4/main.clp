; Cargar plantillas de productos
(load "products/templates.clp")

; Cargar hechos de productos
(load "products/facts.clp")

; Cargar plantillas de mercado
(load "market/templates.clp")

; Cargar hechos de mercado
(load "market/facts.clp")

; Cargar reglas de mercado
(load "market/rules.clp")

; Cargar plantillas de clientes
(load "clients/templates.clp")

; Cargar hechos de clientes
(load "clients/facts.clp")

; Inicializar el entorno
(reset)

; Ejecutar el motor de inferencia
(run)
