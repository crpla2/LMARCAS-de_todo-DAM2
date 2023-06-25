(: Ejercicio 25 Consulta que devuelve los nobmres de los pokemon con la identificación en el nombre de elemento <decada_actual> o <decada_pasada> según la década en la que se capturaron :)
<pokedex>
{
  for $pok in doc("pokemon")//pokemon
  
  return 
  if ($pok/@f_captura<2020)
  then
    <decada_pasada>{
    $pok/nombre/text()
    }</decada_pasada>
    else
     <decada_actual>{
    $pok/nombre/text()
    }</decada_actual>
   
}
</pokedex>
