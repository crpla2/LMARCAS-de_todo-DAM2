(:18  Consulta que devuelve los nombres de todos los pokemon si existe alguno que tenga más de 
dos ataques. :)
for $pok in doc("pokemon")//pokemon
where count($pok//ataque)>2
return $pok//nombre