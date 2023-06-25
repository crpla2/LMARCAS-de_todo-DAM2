 <XML>{
 (:PARA LA CORRECTA VISUALIZACION DEL DOCUMENTO ES NECESARIO CARGAR LOS 7 XML RESULTANTES DE LAS  CONSULTAS DE CADA LIGA EN LA BASE DE DATOS (Estan en la carpeta "practicaXquery\LigaCombatesGo_V2\XMLS") O BIEN PONER LA RUTA ABSOLUTA DE CADA DOCUMENTO, ADEMÁS DE LA BASE DE DATOS "POKEMON":)
 
 for 
   $pok1 in doc("Superball"),
   $pok2 in doc("Ultraball"),
   $pok3 in doc("Masterball"),
   $pok4 in doc("Halloween"),
   $pok5 in doc("Volador"),
   $pok6 in doc("Captura"),
   $pok7 in doc("Elemental") 
 return
 <RESUMEN>{
   '&#10;Liga Super Ball: ',distinct-values($pok1//nombre),
   '&#10;Liga Ultra Ball: ',distinct-values($pok2//nombre),
   '&#10;Liga Master Ball: ',distinct-values($pok3//nombre),
   '&#10;Liga Copa Halloween: ',distinct-values($pok4//nombre),
   '&#10;Liga Copa Volador: ',distinct-values($pok5//nombre),
   '&#10;Liga Copa Captura: ',distinct-values($pok6//nombre),
   '&#10;Liga Copa Elemental: ',distinct-values($pok7//nombre),'&#10;'
 }</RESUMEN>,
 <LigaCombatesGO>{
   doc("Superball"),
   doc("Ultraball"),
   doc("Masterball"),
   doc("Halloween"),
   doc("Volador"),
   doc("Captura"),
   doc("Elemental") 
 }</LigaCombatesGO>
 }</XML>