(: ejercicio 12. Consulta que devuelve los nombres de los pokemon de tipo Fuego capturados después de 2020 con el siguiente formato
<mipokedex>
  <pokemon>
    <nombre>Charmander</nombre>
    <capturado>2030</capturado>
  </pokemon>
</mipokedex>:)
<mipokedex>
{
  for $pok in doc("pokemon")//pokemon
  where $pok/tipo="Fuego" and $pok/@f_captura>2020
  return
  <pokemon>
   {
     $pok/nombre,
     <capturado>{string($pok/@f_captura)}</capturado>
   }
  </pokemon>
}
</mipokedex>