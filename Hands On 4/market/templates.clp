(deftemplate smartphone
   (slot marca)
   (slot modelo)
   (slot color)
   (slot precio))

(deftemplate computadora
   (slot marca)
   (slot modelo)
   (slot color)
   (slot precio))

(deftemplate accesorio
   (slot tipo)
   (slot marca)
   (slot precio))

(deftemplate orden-de-compra
   (slot cliente-id)
   (multislot items))

(deftemplate tarjeta-de-credito
   (slot banco)
   (slot tipo)
   (slot fecha-expiracion))

(deftemplate vale
   (slot valor))
