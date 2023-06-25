(:Ejercicico 10. Consulta que devuelve losn ombres de todos los pokemon en el archivo pokemon.xml y todos los comentarios de cada pokemon contenidos en el archivo descripcion.xml:)
for $pok in doc("pokemon")//pokemon
return
<pokemonEntero>
{
  $pok/nombre,
  doc("descripcion")//entrada[./nombre=$pok/nombre]/comentario
}</pokemonEntero>