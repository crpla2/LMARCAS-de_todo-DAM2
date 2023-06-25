(:Consulta que devuelve los nombres de los pokemon que tengan más de dos ataques 
ordenados por su nombre :)
for $pok in doc("Pokemon")//pokemon
where count($pok//ataque)>2
order by $pok//nombre
return $pok/nombre/text()