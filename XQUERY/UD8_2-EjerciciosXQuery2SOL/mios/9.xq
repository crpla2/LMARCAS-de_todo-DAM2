(:9 Consulta que devuelve de cada pokemon un elemento llamado pokemon que contiene el 
nombre junto con el número de ataques que tiene :)
<pokedex>{
  for $pok in doc("pokemon")//pokemon
return
<pokemon>
{
  $pok/nombre,
  <ataques>
  {
    count($pok//ataque)
  }
  </ataques>
}
</pokemon>
}</pokedex>



