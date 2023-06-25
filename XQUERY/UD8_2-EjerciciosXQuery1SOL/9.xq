(:Ejercicio 9. Consulta que devuelve de cada pokemon un elemento llamado pokemon que contiene el nombre junto con el numero de ataques que tiene con el siguiente aspecto 
<pokemon>
  <nombre>asdfasd</nombre>
  <num_pokemon>3</num_pokemon>
</pokemon>:)
for $pok in doc("pokemon")//pokemon
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