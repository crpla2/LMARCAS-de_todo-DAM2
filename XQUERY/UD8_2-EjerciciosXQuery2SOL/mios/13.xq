(:13 Consulta que devuelve los títulos de los pokemon de tipo Fuego publicados después del año 
2020 con el siguiente formato de salida:)
<mipokedex>{
  for $pok in doc("pokemon")//pokemon
  where $pok/@f_captura>2020
  return 
  <pokemon capturado="{$pok/@f_captura}">{$pok/nombre}</pokemon>
}</mipokedex>