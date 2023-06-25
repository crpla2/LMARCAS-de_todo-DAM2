(:14 Consulta que calcula los puntos de combate medios de los pokemon de cada tipo con el 
formato de salida: :)
for $type in distinct-values(doc("pokemon")//tipo)

return
<tipo>{<nombre>{$type}</nombre>,<pc_medio>{avg(doc("pokemon")//pokemon[tipo=$type]/pc)}</pc_medio>
 
}</tipo>