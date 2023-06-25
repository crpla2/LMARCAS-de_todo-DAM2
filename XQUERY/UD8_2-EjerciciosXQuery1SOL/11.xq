(: Ejercicio 11. Consulta que devuelve el nombre de cada uno de los pokemon del archivo y su número de ataques, pero solo de aquellos pokemon que tienen un número de ataques distinto de 1:)
for $pok in doc("pokemon")//pokemon
where count($pok/ataque)!=1
return
<pokemon>
{
  $pok/nombre,
  <num_ataques>
  {
    count($pok/ataque)
  }
  </num_ataques>
}</pokemon>