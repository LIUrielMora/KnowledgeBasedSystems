(deffacts ordenes-de-compra
   (orden-de-compra 
      (cliente-id 1) 
      (items (smartphone (marca "apple") (modelo "iPhone15") (color "rojo") (precio 17000)) 
             (tarjeta-de-credito (banco "banamex") (tipo "visa") (fecha-expiracion "2023-12-01"))))
   (orden-de-compra 
      (cliente-id 2) 
      (items (smartphone (marca "samsung") (modelo "Note12") (color "negro") (precio 15000)) 
             (tarjeta-de-credito (banco "liverpool") (tipo "visa") (fecha-expiracion "2025-12-01"))))
   (orden-de-compra 
      (cliente-id 1) 
      (items (smartphone (marca "apple") (modelo "iPhone15") (color "rojo") (precio 17000)) 
             (computadora (marca "apple") (modelo "MacBookAir") (color "gris") (precio 25000)))))

(deffacts tarjetas
   (tarjeta-de-credito (banco "banamex") (tipo "visa") (fecha-expiracion "2023-12-01"))
   (tarjeta-de-credito (banco "liverpool") (tipo "visa") (fecha-expiracion "2025-12-01"))
   (tarjeta-de-credito (banco "bbva") (tipo "mastercard") (fecha-expiracion "2024-12-01"))
   (tarjeta-de-credito (banco "santander") (tipo "visa") (fecha-expiracion "2022-12-01")))

(deffacts vales
   (vale (valor 100))
   (vale (valor 200))
   (vale (valor 300))
   (vale (valor 400)))