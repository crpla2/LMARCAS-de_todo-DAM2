(: Ejer 18 Consulta que devuelve los nombres de los pokemon que tienen dos ataques si existe algun pokemon que tenga más de 2:)
if (some $pok in doc("pokemon")//pokemon
satisfies (count($pok/ataque)>2))
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

