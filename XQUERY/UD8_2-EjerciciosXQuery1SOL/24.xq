(: Ejercicio 24: Consulta que devuelve el nombre de todos los pokemon y sus
dos primeros ataques. En el caso de que existan más de dos ataques para un pokemon, se añade un tercer ataque con contenido "y otros" :)

for $pok in doc("pokemon")//pokemon
return
  <pok>
  {
    $pok/nombre,
    $pok/ataque[1]/a_nombre,
    $pok/ataque[2]/a_nombre,
    if (count($pok/ataque)>2)
    then
      <a_nombre>{"y otros"}</a_nombre>
    else
      ()
  }
  </pok>