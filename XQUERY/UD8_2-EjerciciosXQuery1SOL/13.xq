(: Ejercicio 13. Consulta que devuelve todo los nombres de lso pokemon de tipo Fuego capturados después de 2020 con el siguiente formato de salida
<mipokedex>
  <pokemon capturado="2030">
    <nombre>Charmander</nombre>
  </pokemon>
</mipokedex>:)
<mipokedex>
{
  for $pok in doc ("pokemon")//pokemon
  where $pok/tipo="Fuego" and $pok/@f_captura>2020
  return 
  <pokemon capturado="{$pok/@f_captura}">
  {
    $pok/nombre
  }
  </pokemon>
}</mipokedex>