(defrule iphone15-banamex-24-meses
   (orden-de-compra (items ?items))
   (test (member$ (smartphone (marca apple) (modelo iPhone15) (color rojo) ?p) ?items))
   (test (member$ (tarjeta-de-credito (banco banamex) (tipo visa) (fecha-expiracion ?f)) ?items))
   =>
   (printout t "Oferta: 24 meses sin intereses para iPhone 15 con tarjeta Banamex." crlf))

(defrule samsung-note12-liverpool-12-meses
   (orden-de-compra (items ?items))
   (test (member$ (smartphone (marca samsung) (modelo Note12) (color negro) ?p) ?items))
   (test (member$ (tarjeta-de-credito (banco liverpool) (tipo visa) (fecha-expiracion ?f)) ?items))
   =>
   (printout t "Oferta: 12 meses sin intereses para Samsung Note 12 con tarjeta Liverpool VISA." crlf))

(defrule macbookair-iphone15-vales
   (orden-de-compra (items ?items))
   (test (member$ (smartphone (marca apple) (modelo iPhone15) (color rojo) ?p1) ?items))
   (test (member$ (computadora (marca apple) (modelo MacBookAir) (color gris) ?p2) ?items))
   =>
   (bind ?total (+ ?p1 ?p2))
   (bind ?vales (/ ?total 1000))
   (printout t "Oferta: " ?vales " vales de 100 pesos por la compra de MacBook Air y iPhone 15 al contado." crlf))

(defrule smartphone-descuento-accesorios
   (orden-de-compra (items ?items))
   (test (member$ (smartphone ?marca ?modelo ?color ?p) ?items))
   =>
   (printout t "Oferta: 15% de descuento en funda y mica para la compra de un smartphone." crlf))

(defrule descuento-mayoristas
   (cliente (id ?id) (tipo mayorista))
   =>
   (printout t "Descuento especial aplicado para clientes mayoristas." crlf))

(defrule descuento-computadoras
   (orden-de-compra (items ?items))
   (test (member$ (computadora ?marca ?modelo ?color ?p) ?items))
   =>
   (printout t "Descuento del 10% aplicado en accesorios para la compra de cualquier computadora." crlf))

(defrule oferta-accesorios-smartphones
   (orden-de-compra (items ?items))
   (test (member$ (smartphone ?marca ?modelo ?color ?p) ?items))
   =>
   (printout t "Oferta: 10% de descuento en accesorios para la compra de un smartphone." crlf))

(defrule tarjeta-expirada
   (tarjeta-de-credito (banco ?banco) (tipo ?tipo) (fecha-expiracion ?fecha))
   (test (< ?fecha 2024-01-01))
   =>
   (printout t "La tarjeta " ?banco " " ?tipo " está expirada." crlf))

(defrule laptop-dell-descuento-accesorios
   (orden-de-compra (items ?items))
   (test (member$ (computadora (marca dell) (modelo XPS15) ?color ?p) ?items))
   =>
   (printout t "Oferta: 20% de descuento en accesorios para la compra de una Dell XPS 15." crlf))

(defrule smartphone-samsung-descuento-cargador
   (orden-de-compra (items ?items))
   (test (member$ (smartphone (marca samsung) ?modelo ?color ?p) ?items))
   =>
   (printout t "Oferta: 10% de descuento en cargadores para la compra de un smartphone Samsung." crlf))

(defrule laptop-hp-descuento-mochila
   (orden-de-compra (items ?items))
   (test (member$ (computadora (marca hp) ?modelo ?color ?p) ?items))
   =>
   (printout t "Oferta: Mochila gratis para laptops por la compra de una HP." crlf))

(defrule smartphone-huawei-descuento-auriculares
   (orden-de-compra (items ?items))
   (test (member$ (smartphone (marca huawei) ?modelo ?color ?p) ?items))
   =>
   (printout t "Oferta: 15% de descuento en auriculares para la compra de un smartphone Huawei." crlf))

(defrule accesorio-dell-monitor
   (orden-de-compra (items ?items))
   (test (member$ (accesorio (tipo monitor) (marca dell) ?precio) ?items))
   =>
   (printout t "Oferta: Cable HDMI gratis por la compra de un monitor Dell." crlf))

(defrule laptop-microsoft-descuento-software
   (orden-de-compra (items ?items))
   (test (member$ (computadora (marca microsoft) ?modelo ?color ?p) ?items))
   =>
   (printout t "Oferta: 50% de descuento en software Office por la compra de una laptop Microsoft." crlf))

(defrule tarjeta-santander-meses-sin-intereses
   (orden-de-compra (items ?items))
   (test (member$ (tarjeta-de-credito (banco santander) (tipo visa) ?fecha) ?items))
   =>
   (printout t "Oferta: 18 meses sin intereses con tarjeta Santander." crlf))

(defrule smartphone-pixel-descuento-accesorios
   (orden-de-compra (items ?items))
   (test (member$ (smartphone (marca google) (modelo Pixel6) ?color ?p) ?items))
   =>
   (printout t "Oferta: 10% de descuento en accesorios para la compra de un Google Pixel 6." crlf))

(defrule laptop-asus-descuento-mouse
   (orden-de-compra (items ?items))
   (test (member$ (computadora (marca asus) ?modelo ?color ?p) ?items))
   =>
   (printout t "Oferta: Mouse gratis por la compra de una laptop Asus." crlf))

(defrule cliente-vip-descuento-especial
   (cliente (id ?id) (tipo vip))
   =>
   (printout t "Descuento especial del 20% para clientes VIP." crlf))

(defrule smartphone-xiaomi-descuento-funda
   (orden-de-compra (items ?items))
   (test (member$ (smartphone (marca xiaomi) ?modelo ?color ?p) ?items))
   =>
   (printout t "Oferta: Funda gratis por la compra de un smartphone Xiaomi." crlf))

(defrule laptop-lenovo-descuento-teclado
   (orden-de-compra (items ?items))
   (test (member$ (computadora (marca lenovo) ?modelo ?color ?p) ?items))
   =>
   (printout t "Oferta: 15% de descuento en teclados por la compra de una laptop Lenovo." crlf))

(defrule smartphone-iphone-antivirus
   (orden-de-compra (items ?items))
   (test (member$ (smartphone (marca apple) (modelo ?modelo) ?color ?p) ?items))
   =>
   (printout t "Oferta: Antivirus gratuito por la compra de cualquier iPhone." crlf))

(defrule tarjeta-bbva-descuento-especial
   (orden-de-compra (items ?items))
   (test (member$ (tarjeta-de-credito (banco bbva) (tipo mastercard) ?fecha) ?items))
   =>
   (printout t "Oferta: Descuento del 10% en todas las compras con tarjeta BBVA Mastercard." crlf))

