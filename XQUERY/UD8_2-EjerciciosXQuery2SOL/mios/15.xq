(:15Consulta que devuelve los nombres y los comentarios de los pokemon que figuran a la vez 
en el fichero pokemon.xml y descripción.xml :)
for $pok in doc("pokemon")//pokemon, $desc in doc("descripcion")//entrada
where $pok//nombre=$desc//nombre
return
<pokemondescrito>{
  $pok/nombre,$desc/comentario
  
}</pokemondescrito>
