(: ejercicio 19 Consulta que devuevle los nombres de los pokemons si existe alguno del año 2020:)
if (some $pok in doc("pokemon")//pokemon
satisfies ($pok/[@f_captura]=2020))
then (: Devuelve los pokemon con 2 ataques:)
  (for $pok  in doc("pokemon")//pokemon
let $ata:= count($pok/ataque)
return
<pok>
{
  concat($ata, ". ", $pok/nombre/text())
}</pok>)
else 
 ()
