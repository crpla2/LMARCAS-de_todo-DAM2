(: Consulta que devuelve los nombres y las descripciones de los pokemon que figuran a la vez en el fichero pokemon.xml y descripcion.xml :)
for $pok in doc("pokemon")//pokemon, $desc in doc("descripcion")//entrada
where $pok/nombre=$desc/nombre
return
<pokemonDescrito>
{
  $pok/nombre,
  $desc/comentario
}
</pokemonDescrito>