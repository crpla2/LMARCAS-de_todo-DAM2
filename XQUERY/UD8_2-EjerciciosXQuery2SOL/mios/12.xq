(:12  Consulta que devuelve los nombres de los pokemon de tipo Fuego capturados después de 
2020 con el siguiente formato :)
<mipokedex>{
for $pok in doc ("pokemon")//pokemon
  where $pok//tipo="Fuego" and $pok /@f_captura>2020
  return
  <pokemon>{
    $pok/nombre,
    <capturado>{
      $pok/@f_captura/number()
    }</capturado>
  }</pokemon>
}</mipokedex>
