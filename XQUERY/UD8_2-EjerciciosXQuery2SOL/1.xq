(:Ejercicio 1. Muestra el nombre de todos los pokemon y su pc aumentado en 10 unidades.:)
(: Funcion de aumento:)
declare function local:aumento($cantidad as xs:double, $porcentaje as xs:decimal) as xs:double
{
  let $respuesta := $cantidad+($porcentaje)
  return $respuesta
};

(:Expresión XQuery:)
for $pok in doc("pokemon")//pokemon
let $porc := local:aumento(number($pok/pc), 50)
return
<pokemon>{
$pok/nombre,
<pcAumentado>{$porc}</pcAumentado>
}</pokemon>